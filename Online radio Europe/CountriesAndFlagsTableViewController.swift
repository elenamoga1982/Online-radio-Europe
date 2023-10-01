//
//  CountriesAndFlagsTableViewController.swift
//  Online radio Europe
//
//  Created by Elena Moga on 2023-06-16.
//

import UIKit

class CountriesAndFlagsTableViewController: UITableViewController {
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlPath = Bundle.main.url(forResource: "Countries", withExtension: "plist") else {
            return
        }
        
        if let countriesArray = NSArray(contentsOf: urlPath) as?
            Array<Dictionary<String,Any>> {
            
            for countryElement in countriesArray {
                var countryName = countryElement["name"] as! String
                var radioDictionaryArray = countryElement["radios"] as! [Dictionary<String,String>]
                var radios = [Radio]()
                for radioDictionary in radioDictionaryArray {
                    radios.append(Radio(title: radioDictionary["title"]!, url: radioDictionary["url"]!))
                }
                countries.append(Country(name: countryName, radios: radios))
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryAndFlagCell", for: indexPath) as! FlagTableViewCell
        
        cell.textLabel?.text = countries[indexPath.row].name
        
        cell.flagImageView.image = UIImage(named: countries[indexPath.row].name)
        
        return cell
    }

    // instantiate Listen Radio View Controller with push View Controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCountry = countries[indexPath.row]
        if let vc = storyboard?.instantiateViewController(identifier: "ListenRadio", creator: { coder in
            ListenRadioTableViewController(country: selectedCountry, coder: coder)})  {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
