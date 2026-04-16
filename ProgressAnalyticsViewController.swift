import UIKit

// MARK: - ProgressAnalyticsViewController
// Full analytics screen: 14-day XP chart, then-vs-now comparison, key stats.

final class ProgressAnalyticsViewController: UIViewController {

    private let scroll     = UIScrollView()
    private let content    = UIView()
    private let gradLayer  = CAGradientLayer()
    private let backBtn    = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressTracker.shared.recordSnapshot()
        setupBackground()
        setupScrollView()
        buildContent()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar so the custom back button is the only one visible
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradLayer.frame = view.bounds
    }

    // MARK: - Background

    private func setupBackground() {
        gradLayer.colors = [
            UIColor(red: 0.06, green: 0.08, blue: 0.30, alpha: 1).cgColor,
            UIColor(red: 0.10, green: 0.04, blue: 0.40, alpha: 1).cgColor,
        ]
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint   = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradLayer, at: 0)
    }

    // MARK: - Scroll

    private func setupScrollView() {
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.showsVerticalScrollIndicator = false
        view.addSubview(scroll)
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .clear
        scroll.addSubview(content)

        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            content.topAnchor.constraint(equalTo: scroll.topAnchor),
            content.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            content.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            content.widthAnchor.constraint(equalTo: scroll.widthAnchor),
        ])
    }

    // MARK: - Content

    private func buildContent() {
        var lastAnchor = content.topAnchor
        var lastConstant: CGFloat = 0

        func pin(_ v: UIView, top: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat) {
            NSLayoutConstraint.activate([
                v.topAnchor.constraint(equalTo: top, constant: constant),
                v.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 20),
                v.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -20),
            ])
            lastAnchor   = v.bottomAnchor
            lastConstant = 0
        }

        // ── Back button ────────────────────────────────────────────────
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backBtn.tintColor = .white
        backBtn.backgroundColor = UIColor.white.withAlphaComponent(0.18)
        backBtn.layer.cornerRadius = 20
        backBtn.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        content.addSubview(backBtn)
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: content.topAnchor,
                constant: view.safeAreaInsets.top + 10),
            backBtn.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 16),
            backBtn.widthAnchor.constraint(equalToConstant: 40),
            backBtn.heightAnchor.constraint(equalToConstant: 40),
        ])

        // ── Title ──────────────────────────────────────────────────────
        let safeTop = view.safeAreaInsets.top
        let title = makeLabel("📊 Your Progress", size: 26, bold: true)
        title.textAlignment = .center
        content.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: content.topAnchor, constant: safeTop + 14),
            title.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 56),
            title.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -56),
        ])
        lastAnchor = title.bottomAnchor

        // ── Then vs Now card ───────────────────────────────────────────
        let thenNow = makeThenNowCard()
        content.addSubview(thenNow)
        pin(thenNow, top: lastAnchor, constant: 24)

        // ── Section: 14-day chart ──────────────────────────────────────
        let chartHeader = makeSectionHeader("XP earned — last 14 days")
        content.addSubview(chartHeader)
        pin(chartHeader, top: lastAnchor, constant: 24)

        let chartCard = makeChartCard()
        content.addSubview(chartCard)
        pin(chartCard, top: lastAnchor, constant: 10)

        // ── Section: key stats ─────────────────────────────────────────
        let statsHeader = makeSectionHeader("Key stats")
        content.addSubview(statsHeader)
        pin(statsHeader, top: lastAnchor, constant: 24)

        let statsGrid = makeStatsGrid()
        content.addSubview(statsGrid)
        pin(statsGrid, top: lastAnchor, constant: 10)

        // ── Section: subject progress ──────────────────────────────────
        let subjHeader = makeSectionHeader("Subject progress")
        content.addSubview(subjHeader)
        pin(subjHeader, top: lastAnchor, constant: 24)

        let subjCard = makeSubjectCard()
        content.addSubview(subjCard)
        pin(subjCard, top: lastAnchor, constant: 10)

        // ── Bottom padding ─────────────────────────────────────────────
        NSLayoutConstraint.activate([
            lastAnchor.constraint(equalTo: content.bottomAnchor, constant: -40),
        ])
    }

    // MARK: - Then vs Now Card

    private func makeThenNowCard() -> UIView {
        let user    = Session.shared.currentUser
        let nowXP   = user?.xp    ?? 0
        let nowLvl  = user?.level ?? 1

        let thenSnap    = ProgressTracker.shared.snapshotDaysAgo(14)
        let earliestSnap = ProgressTracker.shared.earliestSnapshot()

        // Pick the best "before" reference: 14-day snapshot first, then earliest available.
        // If that snapshot has MORE XP than today the data is stale (account was reset between
        // sessions) — fall back to 0 so we never show XP going backwards.
        var rawSnap = thenSnap ?? earliestSnap
        if let s = rawSnap, s.xp > nowXP { rawSnap = nil }

        let thenXP  = rawSnap?.xp    ?? 0
        let thenLvl = rawSnap?.level ?? 1
        let xpGain  = max(0, nowXP - thenXP)

        // Label for the left column: "14 days ago", "First record", or "Start"
        let thenLabel: String
        if thenSnap != nil && (thenSnap?.xp ?? Int.max) <= nowXP {
            thenLabel = "14 days ago"
        } else if earliestSnap != nil && (earliestSnap?.xp ?? Int.max) <= nowXP {
            thenLabel = "First record"
        } else {
            thenLabel = "Start"
        }

        let card = makeCard(color: UIColor(red: 0.55, green: 0.15, blue: 0.90, alpha: 1))

        let titleLbl = makeLabel("Last 14 days", size: 13, color: UIColor.white.withAlphaComponent(0.65))
        let stack    = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 12

        let thenCol = makeCompareColumn(label: thenLabel, xp: thenXP, level: thenLvl)
        let arrow   = makeLabel("→", size: 22, bold: true)
        arrow.textAlignment = .center
        arrow.translatesAutoresizingMaskIntoConstraints = false

        let nowCol  = makeCompareColumn(label: "Today",
                                        xp: nowXP, level: nowLvl, highlight: true)

        stack.addArrangedSubview(thenCol)
        stack.addArrangedSubview(nowCol)

        let gainText = xpGain > 0 ? "+\(xpGain) XP gained 🎉" : "Keep going to earn XP!"
        let gainLbl = makeLabel(gainText, size: 14, bold: true,
                                color: UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1))
        gainLbl.textAlignment = .center

        for v in [titleLbl, stack, gainLbl] { card.addSubview(v) }
        card.addSubview(arrow)

        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            titleLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),

            stack.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 14),
            stack.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),

            arrow.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            arrow.centerYAnchor.constraint(equalTo: stack.centerYAnchor),

            gainLbl.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 14),
            gainLbl.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            gainLbl.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -16),
        ])
        return card
    }

    private func makeCompareColumn(label: String, xp: Int, level: Int,
                                   highlight: Bool = false) -> UIView {
        let col = UIView()
        col.translatesAutoresizingMaskIntoConstraints = false
        col.backgroundColor = UIColor.white.withAlphaComponent(highlight ? 0.18 : 0.10)
        col.layer.cornerRadius = 12

        let lblTop  = makeLabel(label, size: 11, color: UIColor.white.withAlphaComponent(0.65))
        let xpLbl   = makeLabel("\(xp) XP", size: 18, bold: true)
        let lvlLbl  = makeLabel("Level \(level)", size: 12,
                                color: UIColor(red: 0.96, green: 0.80, blue: 0.10, alpha: 1))

        for v in [lblTop, xpLbl, lvlLbl] { col.addSubview(v) }
        NSLayoutConstraint.activate([
            lblTop.topAnchor.constraint(equalTo: col.topAnchor, constant: 10),
            lblTop.centerXAnchor.constraint(equalTo: col.centerXAnchor),
            xpLbl.topAnchor.constraint(equalTo: lblTop.bottomAnchor, constant: 4),
            xpLbl.centerXAnchor.constraint(equalTo: col.centerXAnchor),
            lvlLbl.topAnchor.constraint(equalTo: xpLbl.bottomAnchor, constant: 2),
            lvlLbl.centerXAnchor.constraint(equalTo: col.centerXAnchor),
            lvlLbl.bottomAnchor.constraint(equalTo: col.bottomAnchor, constant: -10),
        ])
        return col
    }

    // MARK: - Bar Chart

    private func makeChartCard() -> UIView {
        let card = makeCard(color: UIColor(red: 0.08, green: 0.12, blue: 0.38, alpha: 1))
        let data = ProgressTracker.shared.dailyXPEarned(days: 14)
        let maxXP = max(1, data.map { $0.xp }.max() ?? 1)
        let chartHeight: CGFloat = 110

        let chartContainer = UIView()
        chartContainer.translatesAutoresizingMaskIntoConstraints = false
        chartContainer.backgroundColor = .clear
        card.addSubview(chartContainer)

        NSLayoutConstraint.activate([
            chartContainer.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            chartContainer.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 12),
            chartContainer.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -12),
            chartContainer.heightAnchor.constraint(equalToConstant: chartHeight + 24),
            chartContainer.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -12),
        ])

        // Draw bars after layout
        chartContainer.layoutIfNeeded()
        let containerW = UIScreen.main.bounds.width - 40 - 24  // approx
        let slotW = (containerW) / CGFloat(data.count)
        let barW  = max(6, slotW - 5)

        let barColors: [UIColor] = [
            UIColor(red: 0.95, green: 0.28, blue: 0.38, alpha: 1),
            UIColor(red: 0.97, green: 0.52, blue: 0.08, alpha: 1),
            UIColor(red: 0.82, green: 0.22, blue: 0.75, alpha: 1),
            UIColor(red: 0.08, green: 0.55, blue: 0.95, alpha: 1),
            UIColor(red: 0.05, green: 0.70, blue: 0.60, alpha: 1),
            UIColor(red: 0.60, green: 0.18, blue: 0.92, alpha: 1),
            UIColor(red: 0.96, green: 0.74, blue: 0.06, alpha: 1),
        ]

        for (i, entry) in data.enumerated() {
            let x = CGFloat(i) * slotW
            let barH = max(4, CGFloat(entry.xp) / CGFloat(maxXP) * chartHeight)
            let barY = chartHeight - barH

            let bar = UIView(frame: CGRect(x: x + (slotW - barW) / 2,
                                           y: barY, width: barW, height: barH))
            bar.backgroundColor = barColors[i % barColors.count]
            bar.layer.cornerRadius = 4
            chartContainer.addSubview(bar)

            // XP label above bar (only if > 0)
            if entry.xp > 0 {
                let xpLbl = UILabel(frame: CGRect(x: x, y: barY - 18, width: slotW, height: 16))
                xpLbl.text = "\(entry.xp)"
                xpLbl.font = UIFont.systemFont(ofSize: 9, weight: .semibold)
                xpLbl.textColor = UIColor.white.withAlphaComponent(0.75)
                xpLbl.textAlignment = .center
                chartContainer.addSubview(xpLbl)
            }

            // Date label below bar
            let dateLbl = UILabel(frame: CGRect(x: x, y: chartHeight + 2, width: slotW, height: 18))
            dateLbl.text = entry.label
            dateLbl.font = UIFont.systemFont(ofSize: 9)
            dateLbl.textColor = UIColor.white.withAlphaComponent(0.45)
            dateLbl.textAlignment = .center
            chartContainer.addSubview(dateLbl)
        }

        // Zero line
        let line = UIView(frame: CGRect(x: 0, y: chartHeight, width: containerW, height: 1))
        line.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        chartContainer.addSubview(line)

        return card
    }

    // MARK: - Stats Grid

    private func makeStatsGrid() -> UIView {
        let user = Session.shared.currentUser
        let totalXP   = user?.xp ?? 0
        let level     = user?.level ?? 1
        let quests    = UserDefaults.standard.integer(forKey: "total_quests_completed")
        let streak    = StreakManager.shared.currentStreak
        let xp14days  = ProgressTracker.shared.totalXPEarnedInDays(14)
        let avgDaily  = ProgressTracker.shared.averageDailyXP(days: 14)
        let activeDays = ProgressTracker.shared.activeDays(days: 14)
        let bestDay   = ProgressTracker.shared.dailyXPEarned(days: 14).max { $0.xp < $1.xp }

        let items: [(String, String, UIColor)] = [
            ("⭐️", "Total XP\n\(totalXP)", UIColor(red: 0.96, green: 0.74, blue: 0.06, alpha: 1)),
            ("🏆", "Level\n\(level)",       UIColor(red: 0.95, green: 0.28, blue: 0.38, alpha: 1)),
            ("🔥", "Streak\n\(streak) days", UIColor(red: 0.97, green: 0.52, blue: 0.08, alpha: 1)),
            ("✅", "Quests\n\(quests)",       UIColor(red: 0.08, green: 0.55, blue: 0.95, alpha: 1)),
            ("📈", "XP (14 days)\n+\(xp14days)", UIColor(red: 0.82, green: 0.22, blue: 0.75, alpha: 1)),
            ("📅", "Active days\n\(activeDays)/14", UIColor(red: 0.05, green: 0.70, blue: 0.60, alpha: 1)),
            ("⚡️", "Avg/day\n\(avgDaily) XP", UIColor(red: 0.60, green: 0.18, blue: 0.92, alpha: 1)),
            ("🌟", "Best day\n\(bestDay?.xp ?? 0) XP", UIColor(red: 0.96, green: 0.45, blue: 0.10, alpha: 1)),
        ]

        let grid = UIView()
        grid.translatesAutoresizingMaskIntoConstraints = false

        let cols = 2
        let spacing: CGFloat = 12
        let cardH: CGFloat = 100
        var col = 0
        var cards: [UIView] = []

        for (emoji, text, color) in items {
            let parts = text.components(separatedBy: "\n")
            let title = parts.first ?? text
            let value = parts.count > 1 ? parts[1] : ""

            let cell = UIView()
            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.backgroundColor = color.withAlphaComponent(0.85)
            cell.layer.cornerRadius = 16
            cell.layer.shadowColor   = color.cgColor
            cell.layer.shadowOpacity = 0.4
            cell.layer.shadowOffset  = CGSize(width: 0, height: 4)
            cell.layer.shadowRadius  = 6
            cell.layer.masksToBounds = false
            cell.isUserInteractionEnabled = true

            let emojiLbl = makeLabel(emoji, size: 24)
            emojiLbl.textAlignment = .center

            let titleLbl = makeLabel(title, size: 11, color: UIColor.white.withAlphaComponent(0.80))
            titleLbl.textAlignment = .center
            titleLbl.numberOfLines = 1
            titleLbl.adjustsFontSizeToFitWidth = true
            titleLbl.minimumScaleFactor = 0.7

            let valueLbl = makeLabel(value, size: 18, bold: true)
            valueLbl.textAlignment = .center
            valueLbl.numberOfLines = 1
            valueLbl.adjustsFontSizeToFitWidth = true
            valueLbl.minimumScaleFactor = 0.6

            for v in [emojiLbl, titleLbl, valueLbl] { cell.addSubview(v) }
            NSLayoutConstraint.activate([
                emojiLbl.topAnchor.constraint(equalTo: cell.topAnchor, constant: 14),
                emojiLbl.centerXAnchor.constraint(equalTo: cell.centerXAnchor),

                titleLbl.topAnchor.constraint(equalTo: emojiLbl.bottomAnchor, constant: 4),
                titleLbl.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 6),
                titleLbl.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -6),

                valueLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 2),
                valueLbl.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 6),
                valueLbl.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -6),
                valueLbl.bottomAnchor.constraint(lessThanOrEqualTo: cell.bottomAnchor, constant: -10),
            ])

            // Tap — brief scale bounce
            let tap = UITapGestureRecognizer(target: cell, action: nil)
            tap.addTarget(self, action: #selector(didTapStatCard(_:)))
            cell.addGestureRecognizer(tap)

            grid.addSubview(cell)
            cards.append(cell)
            col += 1
            if col >= cols { col = 0 }
        }

        // Layout cards in 2-col grid
        let halfW = (UIScreen.main.bounds.width - 40 - spacing - 2) / 2
        for (i, cell) in cards.enumerated() {
            let c = i % cols
            let r = i / cols
            let x = CGFloat(c) * (halfW + spacing)
            let y = CGFloat(r) * (cardH + spacing)
            NSLayoutConstraint.activate([
                cell.leadingAnchor.constraint(equalTo: grid.leadingAnchor, constant: x),
                cell.topAnchor.constraint(equalTo: grid.topAnchor, constant: y),
                cell.widthAnchor.constraint(equalToConstant: halfW),
                cell.heightAnchor.constraint(equalToConstant: cardH),
            ])
        }

        let rowCount = CGFloat((items.count + cols - 1) / cols)
        NSLayoutConstraint.activate([
            grid.heightAnchor.constraint(equalToConstant: rowCount * cardH + (rowCount - 1) * spacing),
        ])
        return grid
    }

    @objc private func didTapStatCard(_ sender: UITapGestureRecognizer) {
        guard let card = sender.view else { return }
        UIView.animate(withDuration: 0.10, animations: {
            card.transform = CGAffineTransform(scaleX: 0.93, y: 0.93)
        }) { _ in
            UIView.animate(withDuration: 0.20, delay: 0,
                           usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: []) {
                card.transform = .identity
            }
        }
    }

    // MARK: - Subject Progress

    private func makeSubjectCard() -> UIView {
        let card = makeCard(color: UIColor(red: 0.08, green: 0.12, blue: 0.38, alpha: 1))
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 14
        card.addSubview(stack)

        let subjects: [(name: String, color: UIColor, key: String, total: Int)] = [
            ("📐 Math",      UIColor(red: 0.96, green: 0.74, blue: 0.06, alpha: 1), "math_completed_topic_ids", 8),
            ("✍️ English",   UIColor(red: 0.82, green: 0.22, blue: 0.75, alpha: 1), "eng_completed_topic_ids",  8),
            ("🗺️ Geography", UIColor(red: 0.08, green: 0.55, blue: 0.95, alpha: 1), "geo_completed_topic_ids",  8),
            ("🔬 Science",   UIColor(red: 0.05, green: 0.70, blue: 0.60, alpha: 1), "sci_completed_topic_ids",  8),
            ("📜 History",   UIColor(red: 0.92, green: 0.40, blue: 0.08, alpha: 1), "his_completed_topic_ids",  8),
        ]

        for sub in subjects {
            let done  = (UserDefaults.standard.array(forKey: sub.key) as? [Int] ?? []).count
            let pct   = min(1.0, Double(done) / Double(sub.total))
            let row   = makeSubjectRow(name: sub.name, color: sub.color,
                                        done: done, total: sub.total, pct: pct)
            stack.addArrangedSubview(row)
        }

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: card.topAnchor, constant: 18),
            stack.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -18),
        ])
        return card
    }

    private func makeSubjectRow(name: String, color: UIColor,
                                 done: Int, total: Int, pct: Double) -> UIView {
        let row = UIView()
        row.translatesAutoresizingMaskIntoConstraints = false

        let nameLbl = makeLabel(name, size: 14, bold: true)
        let cntLbl  = makeLabel("\(done)/\(total)", size: 12,
                                color: UIColor.white.withAlphaComponent(0.60))

        let track = UIView()
        track.translatesAutoresizingMaskIntoConstraints = false
        track.backgroundColor = UIColor.white.withAlphaComponent(0.12)
        track.layer.cornerRadius = 4

        let fill = UIView()
        fill.translatesAutoresizingMaskIntoConstraints = false
        fill.backgroundColor = color
        fill.layer.cornerRadius = 4

        track.addSubview(fill)
        for v in [nameLbl, cntLbl, track] { row.addSubview(v) }

        NSLayoutConstraint.activate([
            nameLbl.topAnchor.constraint(equalTo: row.topAnchor),
            nameLbl.leadingAnchor.constraint(equalTo: row.leadingAnchor),

            cntLbl.centerYAnchor.constraint(equalTo: nameLbl.centerYAnchor),
            cntLbl.trailingAnchor.constraint(equalTo: row.trailingAnchor),

            track.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 5),
            track.leadingAnchor.constraint(equalTo: row.leadingAnchor),
            track.trailingAnchor.constraint(equalTo: row.trailingAnchor),
            track.heightAnchor.constraint(equalToConstant: 8),
            track.bottomAnchor.constraint(equalTo: row.bottomAnchor),

            fill.topAnchor.constraint(equalTo: track.topAnchor),
            fill.bottomAnchor.constraint(equalTo: track.bottomAnchor),
            fill.leadingAnchor.constraint(equalTo: track.leadingAnchor),
            fill.widthAnchor.constraint(equalTo: track.widthAnchor, multiplier: CGFloat(pct)),
        ])
        return row
    }

    // MARK: - Helpers

    private func makeCard(color: UIColor) -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = color.withAlphaComponent(0.75)
        v.layer.cornerRadius = 20
        v.layer.shadowColor   = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.25
        v.layer.shadowOffset  = CGSize(width: 0, height: 4)
        v.layer.shadowRadius  = 8
        v.layer.masksToBounds = false
        return v
    }

    private func makeSectionHeader(_ text: String) -> UILabel {
        let l = makeLabel(text, size: 14, bold: true,
                          color: UIColor.white.withAlphaComponent(0.55))
        l.textTransform()
        return l
    }

    private func makeLabel(_ text: String, size: CGFloat, bold: Bool = false,
                            color: UIColor = .white) -> UILabel {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = text; l.textColor = color; l.numberOfLines = 0
        l.font = bold ? UIFont.boldSystemFont(ofSize: size) : UIFont.systemFont(ofSize: size)
        return l
    }

    @objc private func didTapBack() { navigationController?.popViewController(animated: true) }
}

private extension UILabel {
    func textTransform() {
        text = text?.uppercased()
        letterSpacing(1.5)
    }
    func letterSpacing(_ spacing: CGFloat) {
        guard let t = text else { return }
        let attrs: [NSAttributedString.Key: Any] = [
            .kern: spacing,
            .foregroundColor: textColor as Any,
            .font: font as Any,
        ]
        attributedText = NSAttributedString(string: t, attributes: attrs)
    }
}
