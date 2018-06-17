unit UHFReader28_Head;

interface
uses DevControl;
   Const
    COM1 = 1;
    COM2 = 2;
    COM3 = 3;
    COM4 = 4;
    COM5 = 5;
    COM6 = 6;
    COM7 = 7;
    COM8 = 8;
    COM9 = 9;
    COM10 = 10;


    OK			    	= $00;

    NoElectronicTag     = $0e;
    OperationError      = $0f;



    OtherError             = $00;//其它错误
    MemoryOutPcNotSupport  = $03;//存储器超限或不被支持的PC值
    MemoryLocked           = $04;//存储器锁定
    NoPower                = $0b;//电源不足
    NotSpecialError        = $0f;//非特定错误


    CmdNotIdentify                = $02;
    OperationNotSupport_          = $03;
    UnknownError                  = $0f;


    ReturnEarly            = $0E;//询查时间结束前返回
  	TimeOut                = $0B;// 指定的询查时间溢出
  	MoreData               = $0D; //本条消息之后，还有消息
  	MCUFull                = $0C;// 读写模块存储空间已满
  	AbnormalCommunication  = $02;
//  	PasswordError          = $03;//访问密码错误
//  	NoTagOperation         = $04;
//  	ParameterError         = $FF;


    
    CommunicationErr = $30;
    RetCRCErr        = $31;
    RetDataErr       = $32;    //数据长度有错误
    CommunicationBusy= $33;
    ExecuteCmdBusy   = $34;
    ComPortOpened    = $35;
    ComPortClose     = $36;
    InvalidHandle    = $37;
    InvalidPort      = $38;
    RecmdErr         = $EE;    //返回指令错误



    InventoryReturnEarly_G2   = $01;//询查时间结束前返回
  	InventoryTimeOut_G2       = $02;// 指定的询查时间溢出
  	InventoryMoreData_G2      = $03; //本条消息之后，还有消息
    ReadermoduleMCUFull_G2    = $04;// 读写模块存储空间已满
  	AccessPasswordError          = $05;//访问密码错误
 //   AccessPasswordErrorWriteALittle =$06;   //访问密码错误，只有部分数据写入
 //   PoorCommunicationWriteALittle =$07;//通讯不畅，只有部分数据写入
 //   TagReturnErrorWriteALittle=$08; //电子标签返回错误代码，且只写入了部分数据
    DestroyPasswordError=$09; // 销毁密码错误
    DestroyPasswordCannotZero=$0a; //销毁密码不能为全0
    TagNotSupportCMD=$0b;// 电子标签不支持该命令
    AccessPasswordCannotZero=$0c;// 对该命令，访问密码不能为全0
    TagProtectedCannotSetAgain=$0d;//电子标签已经被设置了读保护，不能再次设置
    TagNoProtectedDonotNeedUnlock=$0e;//  电子标签没有被设置读保护，不需要解锁
  //  PoorCommunicationWriteFail=$0f;//通讯不畅, 写入失败
    ByteLockedWriteFail=$10;//  有字节空间被锁定，写入失败
    CannotLock=$11;// 不能锁定
    LockedCannotLockAgain=$12;// 已经锁定，不能再次锁定
    ParameterSaveFailCanUseBeforeNoPower=$13;// 参数保存失败,但设置的值在读写模块断电前有效
    CannotAdjust=$14;//无法调整
    InventoryReturnEarly_6B=$15;// 询查时间结束前返回
    InventoryTimeOut_6B=$16;//指定的询查时间溢出
    InventoryMoreData_6B=$17;// 本条消息之后，还有消息
    ReadermoduleMCUFull_6B=$18;// 读写模块存储空间已满
    NotSupportCMDOrAccessPasswordCannotZero=$19;  //电子不支持该命令或者访问密码不能为0
    CMDExecuteErr=$F9;// 命令执行出错
    GetTagPoorCommunicationCannotOperation=$FA; //有电子标签，但通信不畅，无法操作
    NoTagOperation=$FB; //无电子标签可操作
    TagReturnErrorCode=$FC;// 电子标签返回错误代码
    CMDLengthWrong=$FD;// 命令长度错误
    IllegalCMD=$FE;//不合法的命令
    ParameterError=$FF;// 参数错误









  //	NoTagOperation         = $04;
  //	ParameterError         = $FF;

  //   	AbnormalCommunication  = $02;


    Function UHFReader28_GetErrorCodeDesc(errorCode : Byte) : String;
    Function UHFReader28_GetReturnCodeDesc(retCode : Byte) : String;
    Function GetDeviceErrorCodeDesc(errorCode : Byte) : String;
    Function GetDeviceErrorTypeDesc(errorCode : TagErrorCode) : String;
implementation


Function UHFReader28_GetErrorCodeDesc(errorCode : Byte) : String;
begin
    result := '';
    case errorCode of
        OtherError            : result := '其它错误 全部捕捉未被其它代码覆盖的错误';
        MemoryOutPcNotSupport : result := '存储器超限或不被支持的PC值 规定存储位置不存在或标签不支持PC值';
        MemoryLocked          : result := '存储器锁定 存储位置锁定或永久锁定，且不可写入';
        NoPower               : result := '电源不足 标签电源不足，无法执行存储写入操作';
        NotSpecialError       : result := '非特定错误 标签不支持特定错误代码';

    end;
end;

Function UHFReader28_GetReturnCodeDesc(retCode : Byte) : String;
begin
    result := '';
    case retCode of
        InventoryReturnEarly_G2               : result := '询查时间结束前返回';
        InventoryTimeOut_G2                   : result := '指定的询查时间溢出';
        InventoryMoreData_G2                  : result := '本条消息之后，还有消息';
        ReadermoduleMCUFull_G2                : result := '读写模块存储空间已满';
        AccessPasswordError                   : result := '访问密码错误';
      //  AccessPasswordErrorWriteALittle       : result := '访问密码错误，只有部分数据写入';
      //  PoorCommunicationWriteALittle         : result := '通讯不畅，只有部分数据写入';
     //   TagReturnErrorWriteALittle            : result := '电子标签返回错误代码，且只写入了部分数据';
        DestroyPasswordError                  : result := '销毁密码错误';
        DestroyPasswordCannotZero             : result := '销毁密码不能为全0';
        TagNotSupportCMD                      : result := '电子标签不支持该命令';
        AccessPasswordCannotZero              : result := '对该命令，访问密码不能为全0';
        TagProtectedCannotSetAgain            : result := '电子标签已经被设置了读保护，不能再次设置';
        TagNoProtectedDonotNeedUnlock         : result := '电子标签没有被设置读保护，不需要解锁';
     //   PoorCommunicationWriteFail            : result := '通讯不畅, 写入失败';
        ByteLockedWriteFail                   : result := '有字节空间被锁定，写入失败';
        CannotLock                            : result := '不能锁定';
        LockedCannotLockAgain                 : result := '已经锁定，不能再次锁定';
        ParameterSaveFailCanUseBeforeNoPower  : result := '参数保存失败,但设置的值在读写模块断电前有效';
        CannotAdjust                          : result := '无法调整';
        InventoryReturnEarly_6B               : result := '询查时间结束前返回';
        InventoryTimeOut_6B                   : result := '指定的询查时间溢出';
        InventoryMoreData_6B                  : result := '本条消息之后，还有消息';
        ReadermoduleMCUFull_6B                : result := '读写模块存储空间已满';
        NotSupportCMDOrAccessPasswordCannotZero : result := '电子不支持该命令或者访问密码不能为0';
        GetTagPoorCommunicationCannotOperation: result := '有电子标签，但通信不畅，无法操作';
        NoTagOperation                        : result := '无电子标签可操作';
        TagReturnErrorCode                    : result := '电子标签返回错误代码';
        CMDLengthWrong                        : result := '命令长度错误';
        IllegalCMD                            : result := '不合法的命令';
        ParameterError                        : result := '参数错误';


        RecmdErr            : result := '返回指令错误';
        CommunicationErr    : result := '通讯错误';
        RetCRCErr           : result := 'CRC校验错误';
        RetDataErr          : result := '返回数据长度有错误';
        CommunicationBusy   : result := '通讯繁忙，设备正在执行其他指令';
        ExecuteCmdBusy      : result := '繁忙，指令正在执行';
        ComPortOpened       : result := '端口已打开';
        ComPortClose        : result := '端口已关闭';
        InvalidHandle       : result := '无效句柄';
        InvalidPort         : result := '无效端口';
    end;
end;
 Function GetDeviceErrorCodeDesc(errorCode : Byte) : String;
begin
   result := '';
   case errorCode of
    0: Result:= '操作成功!';
    1: Result:= '属性错误!';
    2: Result:= '没有登入!';
    3: Result:= '验证失败!';
    4: Result:= 'socket错误!';
    5: Result:= '内存错误!';
    6: Result:= '超时!';
    7: Result:= '函数参数错误!';
    8: Result:= '请求和回复属性不匹配!';
    9: Result:= '操作不支持!';
   end;    //
end;

Function GetDeviceErrorTypeDesc(errorCode : TagErrorCode) : String;
begin
   result := '';
   case errorCode of
    DM_ERR_OK: Result:= '操作成功!';
    DM_ERR_PARA: Result:= '属性错误!';
    DM_ERR_NOAUTH: Result:= '没有登入!';
    DM_ERR_AUTHFAIL: Result:= '验证失败!';
    DM_ERR_SOCKET: Result:= 'socket错误!';
    DM_ERR_MEM: Result:= '内存错误!';
    DM_ERR_TIMEOUT: Result:= '超时!';
    DM_ERR_ARG: Result:= '函数参数错误!';
    DM_ERR_MATCH: Result:= '请求和回复属性不匹配!';
    DM_ERR_MAX: Result:= '操作不支持!';
   end;
end;

end.
