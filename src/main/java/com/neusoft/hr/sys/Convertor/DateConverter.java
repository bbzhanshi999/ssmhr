package com.neusoft.hr.sys.Convertor;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.util.Date;

public class DateConverter implements Converter<String, Date> {

    @Override
    public Date convert(String createtime) {

        try {
            return DateUtils.parseDate(createtime,"yyyy-MM-dd HH:mm:ss","yyyy-MM-dd");
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}

