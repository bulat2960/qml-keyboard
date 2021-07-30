#include "keyboardcontroller.h"

#include <QDebug>

KeyboardController::KeyboardController()
{
    m_mainLayoutData << "1\n-." << "2\nABC" << "3\nDEF"
                     << "4\nGHI" << "5\nJKL" << "6\nMNO"
                     << "7\nPQRS" << "8\nTUV" << "9\nWXYZ"
                     << "0\nПробел";
}

QStringList KeyboardController::mainLayoutData() const
{
    return m_mainLayoutData;
}

void KeyboardController::parseButtonText(QString buttonText)
{
    // Accept button pressed
    if (buttonText == "Accept") {
        emit accepted();
        return;
    }

    // Reject button pressed
    if (buttonText == "Reject") {
        emit rejected();
        return;
    }

    if (buttonText.size() > 1) {
        // User pressed button on main layout
        emit layoutChangeRequested(buttonText);
    } else {
        // User pressed space button
        if (buttonText == ' ') {
            emit spaceButtonPressed();
            return;
        }

        // User pressed non-space text button
        emit newSymbolReceived(buttonText);
    }
}
