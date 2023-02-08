//
//  ChatViewController.swift
//  Chatik
//
//  Created by user on 08.02.2023.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind

}

class ChatViewController: MessagesViewController {

    let selfSender = Sender(senderId: "1", displayName: "Name") // мы
    let otherSender = Sender(senderId: "2", displayName: "Mike") //  тот кто будет посылать сообщения
    let service = Service.shared
    var chatID: String? // if chaId == nil {its new chat}
    var otherId: String?



    var messages = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(
            sender: selfSender,
            messageId: "1",
            sentDate: Date().addingTimeInterval(-2015),
            kind: .text("Привет")
        ))

        messages.append(Message(
            sender: otherSender,
            messageId: "2",
            sentDate: Date().addingTimeInterval(-2015),
            kind: .text("Привет!")
        ))

        messages.append(Message(
            sender: selfSender,
            messageId: "1",
            sentDate: Date().addingTimeInterval(-2015),
            kind: .text("How are you?")
        ))

        messages.append(Message(
            sender: selfSender,
            messageId: "2",
            sentDate: Date().addingTimeInterval(-2015),
            kind: .text("Fine")
        ))
        setupMessages()
        messageInputBar.delegate = self

    }

    private func setupMessages() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

        showMessageTimestampOnSwipeLeft = true
    }

}

extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate, MessagesDataSource  {
    func currentSender() -> MessageKit.SenderType {
        return selfSender
    } // кто главный

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
}

extension ChatViewController:  InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {

        let msg = (Message(sender: selfSender, messageId: "!", sentDate: Date(), kind: .text(text)))

        messages.append(msg)
        service.sendMessage(otherId: otherId!, convoId: chatID!, message: msg, text: text) { [weak self] isSend in
            DispatchQueue.main.async {
                inputBar.inputTextView.text = nil
                self?.messagesCollectionView.reloadDataAndKeepOffset()//когда приходит сообщения, чат автоматически к нему перелистывается
            }
        }
    }
}
