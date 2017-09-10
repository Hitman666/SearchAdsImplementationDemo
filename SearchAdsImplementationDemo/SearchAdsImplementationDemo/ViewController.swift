//
//  ViewController.swift
//  SearchAdsImplementationDemo
//
//  Created by Nikola on 9/5/17.
//  Copyright © 2017 TelTech. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController {
    @IBOutlet weak var searchAdsInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSearchAdsInfo();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getSearchAdsInfo() {
        ADClient.shared().requestAttributionDetails({ (attributionDetails, error) in
            if error == nil {
                for (type, adDictionary) in attributionDetails! {
                    print(type);
                    print(adDictionary);
                    
                    let attribution = adDictionary as? Dictionary<AnyHashable, Any>;
                    
                    let iadAdgroupId = attribution?["iad-adgroup-id"] as? String
                    let iadAdgroupName = attribution?["iad-adgroup-name"] as? String
                    let iadAttribution = attribution?["iad-attribution"] as? String
                    let iadCampaignId = attribution?["iad-campaign-id"] as? String
                    let iadCampaignName = attribution?["iad-campaign-name"] as? String
                    let iadClickDate = attribution?["iad-click-date"] as? String
                    let iadConversionDate = attribution?["iad-conversion-date"] as? String
                    let iadCreativeId = attribution?["iad-creative-id"] as? String
                    let iadCreativeName = attribution?["iad-creative-name"] as? String
                    let iadKeyword = attribution?["iad-keyword"] as? String
                    let iadLineitemId = attribution?["iad-lineitem-id"] as? String
                    let iadLineitemName = attribution?["iad-lineitem-name"] as? String
                    let iadOrgName = attribution?["iad-org-name"] as? String
                    
                    self.searchAdsInfoLabel.text = "iad-adgroup-id: \(iadAdgroupId ?? "")\niad-adgroup-name: \(iadAdgroupName ?? "")\niad-attribution: \(iadAttribution ?? "")\niad-campaign-id: \(iadCampaignId ?? "")\niad-campaign-name: \(iadCampaignName ?? "")\niad-click-date: \(iadClickDate ?? "")\niad-conversion-date: \(iadConversionDate ?? "")\niad-creative-id: \(iadCreativeId ?? "")\niad-creative-name: \(iadCreativeName ?? "")\niad-keyword: \(iadKeyword ?? "")\niad-lineitem-id: \(iadLineitemId ?? "")\niad-lineitem-name: \(iadLineitemName ?? "")\niad-org-name: \(iadOrgName ?? "")"
                }
            }
        })
    }
}

