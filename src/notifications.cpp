#include "notifications.h"

#include <QDebug>

Notifications::Notifications(QObject *parent) : QObject(parent)
{

}

QColor Notifications::colorForType(Notifications::NotificationType type)
{
    switch (type) {
    case Error:
        return QColor("#c0392b");
    case Succes:
        return QColor("#7dc5b2");
    case Generic:
    default:
        return QColor("#3498db");
    }
}
