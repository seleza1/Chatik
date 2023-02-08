//
//  ChatViewController.swift
//  Chatik
//
//  Created by user on 08.02.2023.
//

import UIKit
import MessageKit

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
            kind: .text("Привет! все хорошо")
        ))

        messages.append(Message(
            sender: selfSender,
            messageId: "3",
            sentDate: Date().addingTimeInterval(-2015),
            kind: .text("А ты")
        ))
        setupMessages()

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
