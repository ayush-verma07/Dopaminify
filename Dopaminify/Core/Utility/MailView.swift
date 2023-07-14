//
//  MailView.swift
//  Dopaminify
//
//  Created by Ayush on 6/30/23.
//

import SwiftUI
import MessageUI


struct MailView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MFMailComposeViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        guard MFMailComposeViewController.canSendMail() else {
            fatalError("Mail services are not available")
        }
        
        let mailComposeViewController = MFMailComposeViewController()
        mailComposeViewController.setToRecipients(["help@dopaminify.com"])
        mailComposeViewController.setSubject("Dopaminify Support")
        mailComposeViewController.setMessageBody("", isHTML: false)
        mailComposeViewController.mailComposeDelegate = context.coordinator
        
        return mailComposeViewController
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {
        // No need to update the view controller
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
}
