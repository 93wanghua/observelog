package com.shakespeare.logMonitor.bolt;

import backtype.storm.topology.BasicOutputCollector;
import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.topology.base.BaseBasicBolt;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Tuple;
import backtype.storm.tuple.Values;
import com.shakespeare.logMonitor.domain.Message;
import com.shakespeare.logMonitor.domain.Record;
import com.shakespeare.logMonitor.utils.MonitorHandler;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

/**
 * Describe: 将触发信息保存到mysql数据库中
 * Author:   maoxiangyi
 * Domain:   www.itcast.cn
 * Data:     2015/11/11.
 */
//BaseRichBolt 需要手动调ack方法，BaseBasicBolt由storm框架自动调ack方法
public class PrepareRecordBolt extends BaseBasicBolt {
    private static Logger logger = Logger.getLogger(PrepareRecordBolt.class);

    public void execute(Tuple input, BasicOutputCollector collector) {
        Message message = (Message) input.getValueByField("message");
        String appId = input.getStringByField("appId");
        MonitorHandler.notifly(appId, message);
        Record record = new Record();
        try {
            BeanUtils.copyProperties(record, message);
            collector.emit(new Values(record));
        } catch (Exception e) {

        }
    }

    public void declareOutputFields(OutputFieldsDeclarer declarer) {
        declarer.declare(new Fields("record"));
    }

}
