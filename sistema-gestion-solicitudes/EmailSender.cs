using sistema_gestion_solicitudes;
using System.Net;
using System.Net.Mail;

public class EmailSender : IEmailSender
{
    public Task SendEmailAsync(string email, string subject, string message)
    {
        var client = new SmtpClient("smtp.office365.com", 587)
        {
            EnableSsl = true,
            UseDefaultCredentials = false,
            Credentials = new NetworkCredential("juvera_96@hotmail.com", "S804K;r0HR9n")
        };

        return client.SendMailAsync(
            new MailMessage(from: "juvera_96@hotmail.com",
                            to: email,
                            subject,
                            message
                            ));

    }


}