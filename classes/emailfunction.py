import os
import smtplib
from email.message import EmailMessage

class emailfunction:
    def __init__(self):
        self.sender_email = os.environ.get('My_Email')
        self.password_email = os.environ.get('My_Password')
        self.message = None

    def sendemail_accepted(self, receiver, name_receiver, appointmentid):
        self.message = EmailMessage()
        self.message["From"] = self.sender_email
        self.message["Subject"] = "Appointment Request No.%s" % appointmentid
        self.message["To"] = receiver + "@my.xu.edu.ph"
        self.message.set_content("Good day %s, your appointment is approved!!" % name_receiver.split(" ")[0])

        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as self.server:
            self.server.login(self.sender_email, self.password_email)
            self.server.send_message(self.message)

    def sendemail_declined(self, receiver, name_receiver, appointmentid):
        self.message = EmailMessage()
        self.message["From"] = self.sender_email
        self.message["Subject"] = "Appointment Request No.%s" % appointmentid
        self.message["To"] = receiver + "@my.xu.edu.ph"
        self.message.set_content("Good day %s, your appointment is declined!!" % name_receiver.split(" ")[0])

        with smtplib.SMTP_SSL("smtp.gmail.com", 465) as self.server:
            self.server.login(self.sender_email, self.password_email)
            self.server.send_message(self.message)