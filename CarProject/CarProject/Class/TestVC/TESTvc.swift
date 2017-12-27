//
//  TESTvc.swift
//  CarProject
//
//  Created by macos on 2017/12/20.
//  Copyright © 2017年 macos. All rights reserved.
//

import UIKit

class TESTvc: DDBaseViewController {

    @IBAction func aliPayAction(_ sender: Any) {
        
        let getAlipay = "alipay_sdk=alipay-sdk-php-20161101&app_id=2017041706760617&biz_content=%7B%22body%22%3A%22%E8%AE%A2%E5%8D%95%E6%94%AF%E4%BB%98%22%2C%22subject%22%3A+%22%E5%98%80%E5%93%92%E7%A7%91%E6%8A%802017122099555254%E5%8F%B7%E8%AE%A2%E5%8D%95%22%2C%22out_trade_no%22%3A+%222017122099555254%22%2C%22timeout_express%22%3A+%22120m%22%2C%22total_amount%22%3A+%2210.01%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%7D&charset=UTF-8&format=json&method=alipay.trade.app.pay&notify_url=http%3A%2F%2Fml.nnddkj.com%2Fmeimeila%2FAPI%2Falipay%2FcheckAlipayResult.php&sign_type=RSA2&timestamp=2017-12-20+15%3A29%3A00&version=1.0&sign=CN9jHdiEJfQbTXhjKAkj4R%2FwwmGLX4gH0jV%2FQB%2BEoWYV7bRCZOu%2BIZY100Y12YFxsZw5UUybnpRY8XpHS023qzHrBVqQWfobDqobchez1DDUwd9kHI7s9r%2BcDmcMzLAj8amB0%2Flxd%2B2nZs2tVTThaurzIqRvLZc30j5yLsEMoEdryY6ktqFUFt6ymsNoJQzvPbYsuxBysR8X6r0pH4Q2q18MbrcJdCwpWwsklNGnJobiXCtDFoicAT80LzdDG30j2qD02Y4%2FDLA%2BBh3T6%2Bt0cnK5h%2BW2RdfVPNu5uwvZ%2FEF3kzQzBKtJGMwvlqBGsB7oKF973cH6fAfwx1Bh3G0QlA%3D%3D"
    let orderID = "2017122099555254"

        DDAliPay.shared.payAction(orderStr: getAlipay) { (result) in
            
            print(result);
            
            BFunction.shared.showSuccessMessage("支付成功!");
        }
        
    }
    
    
    @IBAction func weChatPayAction(_ sender: Any) {
        
          let orderID = "2017122056564898"
          let  appid = "wxd347cc7e928e1a43";
          let  noncestr = "asjQCFm3QxfyupgzEdjPuplLUJGTmiOG";
          let  package = "Sign=WXPay";
          let partnerid = "1481248072";
          let  prepayid = "wx20171220152320204572fa310925151093";
          let  sign = "8FC518DA5985244D5D0796699774F2F8";
          let  timestamp = 1513754600;

        let model = DDWechatPayModel.init()
        model.appid = appid;
        model.timestamp = timestamp;
        model.noncestr = noncestr;
        model.package = package;
        model.partnerid = partnerid;
        model.sign = sign;
        model.prepayid = prepayid;
        
        DDWechatPay.shared.payAction(payModel: model);
        
    }
    
    
    @IBOutlet weak var weChatPay: UIButton!
    
    //iOS8用到XIB必须写这两个方法
    init() {
        super.init(nibName: String.init(describing: TESTvc.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mapAction(_ sender: Any) {
        
        let vc = MapVC();
        self.navigationController?.pushViewController(vc, animated: true);
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
