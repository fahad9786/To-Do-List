// Created by Fahad Sheikh on 2023-10-27.

import Foundation
import FirebaseAuth  // Add this import statement

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""  // Initialize the property

    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.currentUserId = user?.uid ?? ""
            DispatchQueue.main.async {
                // No need to set currentUserId again, it's already set above
            }
        }
    }

    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

