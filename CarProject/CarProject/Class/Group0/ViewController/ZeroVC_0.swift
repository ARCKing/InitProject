//
//  ZeroVC_0.swift
//  CarProject
//
//  Created by macos on 2017/12/20.
//  Copyright © 2017年 macos. All rights reserved.
//

import UIKit

class ZeroVC_0: DDBaseViewController {

    @IBAction func Action(_ sender: Any) {
        
        let vc = TESTvc();
        vc.title = "支付测试"
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkReachabilitStatue();
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
