#ifndef OPENDATAFILEDIALOG_H
#define OPENDATAFILEDIALOG_H

#include <QDialog>
#include<QGridLayout>
#include "Controller/SignalController.h"
#include "Vo/sumsignalandprojectnamevo.h"
#include<QStandardItemModel>
#include "mainwindow.h" //危险重复引用
namespace Ui {
class OpenDataFileDialog;
}

class OpenDataFileDialog : public QDialog
{
    Q_OBJECT

public:
    explicit OpenDataFileDialog(MainWindow *mv,QWidget *parent = nullptr);
    void setMainWindow(MainWindow *mw);
    ~OpenDataFileDialog();

private:
    void initTableViewData();
private slots:
    void on_tableView_pressed(const QModelIndex &index);

    void on_tableView_clicked(const QModelIndex &index);

    void on_pushButtonOpen_clicked();

private:
    Ui::OpenDataFileDialog *ui;
    SignalController controller;
    int index = -1;
    QVector<SumSignalAndProjectNameVo> res;
    MainWindow *mv = nullptr;
};

#endif // OPENDATAFILEDIALOG_H
