class ContactMailer < ApplicationMailer
    
def thanks_mail(contact)
    @contact = contact 
    mail(to: contact.email, :subject => "お問い合わせありがとうございました")
end 
    

def received_mail(contact)
    @contact = contact 
    mail(to: "engineer0906ryo@gmail.com", :subject => "お問い合わせがありました")
end 
    
end
