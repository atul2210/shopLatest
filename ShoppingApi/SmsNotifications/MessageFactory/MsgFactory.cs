﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Model;
using System.Collections;

namespace ShoppingApi.SmsNotifications.MessageFactory
{
    public class MsgFactory: ImessageFactory
    {

        public Task<int> SendOtp(int msgType, string mobile, OtpAndSms smsUrl, OtpSenderModel otpData)
        {

            
           IsmsNotification<string, OtpAndSms,OtpSenderModel> factory = null;
            Task<int> otp = null;
            try
            {



                switch (msgType)
                {
                    case 1: //MessageTypeEnum.otp:
                        {
                            factory = new Otpsender();
                            break;

                        }
                    default:
                        {
                            throw new InvalidOperationException();

                        }

                }

                otp = factory.SendOtp(mobile, smsUrl, otpData);
            }
            catch
            {
                throw;

            }
            return otp;
        }

    }
 }

