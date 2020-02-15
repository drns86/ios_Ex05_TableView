//
//  ViewController.swift
//  Ex05_TableView
//
//  Created by 동명섭 on 02/02/2020.
//  Copyright © 2020 downy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    let names:[String] = [
    "아이린", "태연", "아이유", "윤아", "수지"]
    let arts:[String] = [
    "빨간맛, 파워업", "호텔델루나, 사계", "좋은날, 스물셋", "효리네 민박, 바람이불면", "건축학 개론, FacesOfLove"]
    let images:[String] = [
        "img1.png", "img2.png", "img3.png","img4.png", "img5.png",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이벤트 수신자를 자신으로 설정
        //일반 이벤트 : UITableViewDelegate
        self.tableView.delegate = self
        
        //데이터 소스 이벤트 : UITableViewDataSource
        self.tableView.dataSource = self
    }

    //MARK: - 데이터 소스
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Indexpath : Section(그룹), index : 0, 1, 2
        //            단일 섹션은 0만 내려옴
        //Row index : 0, 1, 2, 3, 4
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.labelName.text = names[indexPath.row]
        cell.labelArt.text = arts[indexPath.row]
        cell.idolImageView?.image = UIImage(named: images[indexPath.row])
        
        //테이블뷰 아이템 클릭시 회색 강조 없애기 cellForRowAt
        cell.selectionStyle = .none
        
        return cell
    }
    
    //MARK:- 일반 이벤트
    //셀의 높이를 입력해줌.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //셀이 클릭 됐을때 이벤트 처리
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 셀의 위치: 섹션", indexPath.section)
        print("선택된 셀의 위치: 열", indexPath.row)
    }
    
}
