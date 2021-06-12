import smtplib
from email.message import EmailMessage

class emailfunction:
    def __init__(self):
        self.password_email = ""
        self.message = None

    def sendemail(self, sender, receiver, name_receiver, appointmentid):
        self.message = EmailMessage()
        self.message["From"] = sender
        self.message["Subject"] = "Appointment Request No.%s" % appointmentid
        self.message["To"] = receiver + "@my.xu.edu.ph"
        self.message.set_content("Wassup %s, your appointment is approved!!" % name_receiver.split(" ")[0])

        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as self.server:
            self.server.login(sender, self.password_email)

            self.server.send_message(self.message)

# Example below
# emailfunction().sendemail("HiraethDesu@gmail.com", "shanpadayhag@gmail.com", "BOBO", "1")