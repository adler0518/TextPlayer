# TextPlayer
iOS 语音播报 - 文字朗读


## API说明
AVSpeechSynthesizer相当于一个录音机（控制播放，及获得播放状态），AVSpeechUtterance相当于一个磁盘（音质，语速，音调等）

voice AVSpeechSynthesisVoice，设置朗读文字的语言，如果不设置会默认为当前系统的语言,

    使用[NSLocale availableLocaleIdentifiers]可以获取语言列表
rate 0.0-1.0，设置朗读的速度

pitchMultiplier 0.5-2.0，设置朗读的音调

volume 0.0-1.0，朗读的声音大小

preUtteranceDelay 距离上一句结束的间隔

postUtteranceDelay 下一句朗读距离该句结束开始的间隔


##AVSpeechSynthesisVoice 对照表

	附录：AVSpeech支持的语言种类
	    对照中文（不是一一对应关系）

    中文(简体中文)
    阿拉伯语(沙特阿拉伯)
    中文(普通话)
    中文(香港)
    中文(台湾)
    捷克
    丹麦
    荷兰语(比利时)
    荷兰语
    英语(澳大利亚)
    英语(英国)
    英语(爱尔兰)
    英语(美国)
    英语(南非)
    芬兰语
    法语(加拿大)
    法语(标准)
    德语(标准)
    希腊语
    北印度语
    匈牙利语
    印尼语
    意大利语(标准)
    日语
    韩语
    挪威语
    波兰语
    葡萄牙语(巴西)
    葡萄牙语(葡萄牙)
    罗马尼亚语
    俄语
    斯洛伐克语
    西班牙语
    西班牙语(墨西哥)
    瑞典语
    泰语
    土耳其语
    
##备注
AVSpeechSynthesizer 实例使用一份，否则在连续播放时会导致线程抢占资源导致无法播放

