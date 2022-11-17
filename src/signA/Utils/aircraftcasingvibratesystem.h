/******************************************************************************
 * Copyright 2022/10/11 Co., Ltd.
 * All right reserved. See COPYRIGHT for detailed Information.
 *
 * @file       aircraftcasingvibratesystem.h
 * @brief      文件概述：辅助主函数进行参数初始化的类
 *
 * @author     wangzexin<wangzexin19990311@163.com>
 * @date       2022/10/11
 * @location   哈尔滨理工大学人工智能实验室
 *****************************************************************************/
#ifndef AIRCRAFTCASINGVIBRATESYSTEM_H
#define AIRCRAFTCASINGVIBRATESYSTEM_H
#include <QString>
#include <QMap>
#include <vector>
#include <map>
#include <QMutex>
#include "ThreadSafeQueue.h"
#include "Signal/StaticSpectralEchoSignal.h"
#include <QScopedPointer>
#include "Controller/SignalController.h"
#include "Domain/sumSignal.h"
#include "RedisTools/rediscontroller.h"
#include "Vo/analysisresult.h"
class StaticSpectralEchoSignal;

class AirCraftCasingVibrateSystem
{
public:
    AirCraftCasingVibrateSystem();
    static AirCraftCasingVibrateSystem * getInstance(){ //单列模式
        static AirCraftCasingVibrateSystem * app = new AirCraftCasingVibrateSystem();
        return app;
    }
    bool m_isAlarm;//是否报警
    double m_alarmLimit;//报警上限
    static const int SHOW_CHANNEL_USE = 3; 	/// 通道使用标志
    static const int SHOW_CHANNEL_MEASURETYPE = 4; /// 通道测量类型1
    static const int SHOW_CHANNEL_FULLVALUE = 5; 	/// 满度量程1
    static const int SHOW_CHANNEL_SENSECOEF = 6; 	/// 传感器灵敏度1
    static const int SHOW_CHANNEL_UPFREQ = 10; 	/// 上限频率1
    static const int SHOW_CHANNEL_DOWNFREQ = 11; 	/// 下限频率1
    static const int SHOW_CHANNEL_ACQ_INPUTMODE = 12; 	/// 输入方式1
    static const int SHOW_CHANNEL_ANTIFILTER = 14; 	/// 抗混滤波器
    static const int SHOW_ELC_PRESSURE = 90;        ///电压测量范围1

/******************************王泽鑫10月24日周更改****************************************************/


    int m_icollectState = 0; //采集状态 0 ：停止采集 1：开始采集 2：暂停采集

    int data_length = 20000;

    int m_icollectSignalsStoreCount = 20000; //采集信号的存储数量。

    bool m_bisSave = false; //保存状态

    bool m_blocalSignalExist = true;    //回放的文件是否存在

    volatile int m_iplaybackState = 0;  //回放状态   0 : 不回放 1：开始回放 2：:暂停回放

    std::vector<QString> m_vchannelCodes;    //通道集合

    std::map<QString,QString> dataUrl;  //文件路径

    std::map<QString,std::shared_ptr<StaticSpectralEchoSignal>> echoSignalQueue; //采集回显map

    bool m_bThread; //采集标志位

    std::map<QString,ThreadSafeQueue<double>> m_mpcolllectioinDataQueue; //采集的数据

    std::map<QString,ThreadSafeQueue<double>> m_mpredisCollectionDataQueue; //redis数据

    SignalController m_signalController;

    SumSignal *m_sumSignal;

    QMutex saveSignalMutex;

    enum RedisState{REDIS_OPEND,REDIS_NOT_OPEN};             //redis标志位
    RedisState redisState = REDIS_OPEND;

    QString initHost; //redis   host

    int initPort; //redis   port

    RedisController *m_redis;

    int channelNumber = 4;                    //通道总数

    /*****************************江德鸿************************************************/
    enum PlayBackDataState{EXIST,NO_EXIST};
    PlayBackDataState playBackDataState = NO_EXIST;

    void AirCraftCasingVibrateSystemInit();
    void statrCapture();
    void stopCapture();
    void suspenCapture();
/**********************************************************************************/


    std::shared_ptr<std::map<QString, QVector<AnalysisResult> > > getAnalysisResult() const;
    void clearAnalysisResult();
private:
    std::shared_ptr<std::map<QString,QVector<AnalysisResult>>> analysisResult;
};



#endif // AIRCRAFTCASINGVIBRATESYSTEM_H
