#ifndef KEYBOARDCONTROLLER_H
#define KEYBOARDCONTROLLER_H

#include <QObject>
#include <QStringList>

class KeyboardController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList mainLayoutData READ mainLayoutData)

public:
    KeyboardController();

    QStringList mainLayoutData() const;

public slots:
    void parseButtonText(QString buttonText);

signals:
    void layoutChangeRequested(QString buttonText);
    void newSymbolReceived(QString symbol);

    void spaceButtonPressed();

    void accepted();
    void rejected();

private:
    QStringList m_mainLayoutData;
};

#endif // KEYBOARDCONTROLLER_H
