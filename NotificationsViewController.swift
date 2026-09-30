import UIKit

final class NotificationsViewController: GradientBackgroundViewController {

    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var timePicker: UIDatePicker!

    private enum K {
        static let enabled = "notif_enabled"
        static let time = "notif_time"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)

        timePicker.setValue(UIColor.white, forKey: "textColor")

        // Defaults (first run)
        if UserDefaults.standard.object(forKey: K.enabled) == nil {
            UserDefaults.standard.set(false, forKey: K.enabled)
        }
        if UserDefaults.standard.object(forKey: K.time) == nil {
            UserDefaults.standard.set(Date(), forKey: K.time)
        }

        reminderSwitch.isOn = UserDefaults.standard.bool(forKey: K.enabled)

        if let saved = UserDefaults.standard.object(forKey: K.time) as? Date {
            timePicker.date = saved
        }

        timePicker.preferredDatePickerStyle = .wheels
        timePicker.datePickerMode = .time
        // These two lines used to unconditionally force isEnabled/alpha back to "on"
        // right after the lines below set them from reminderSwitch.isOn, so the time
        // picker looked interactive even when reminders were turned off.
        timePicker.isEnabled = reminderSwitch.isOn
        timePicker.alpha = reminderSwitch.isOn ? 1.0 : 0.4
    }

    @IBAction func didToggleReminder(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: K.enabled)
        timePicker.isEnabled = sender.isOn
        timePicker.alpha = sender.isOn ? 1.0 : 0.4
    }

    @IBAction func didChangeTime(_ sender: UIDatePicker) {
        UserDefaults.standard.set(sender.date, forKey: K.time)
    }
}
