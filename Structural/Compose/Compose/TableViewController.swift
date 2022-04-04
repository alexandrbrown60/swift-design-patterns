//
//  TableViewController.swift
//  Compose
//
//  Created by Александр Иванов on 03.04.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    //Создаем объект папки
    private var currentFolder: Compose = Folder(name: "New folder")
    
    //В данном кейсе, для упрощения, рекурсивно создаем View при переходе в папку
    private var tableViewController: TableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController
        return vc!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Bar buttons action
    
    @IBAction func addFileBarButton(_ sender: UIBarButtonItem) {
        //Добавляем файлы в текущую папку
        currentFolder.addComponent(c: File(name: "New file"))
        tableView.reloadData()
        
    }
    
    @IBAction func addFolderBarItem(_ sender: UIBarButtonItem) {
        //Добавляем папку в текущую папку
        currentFolder.addComponent(c: Folder(name: "New folder"))
        tableView.reloadData()
    }
        

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        currentFolder.contentCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        guard let content = currentFolder.showContent() as? [Compose] else { fatalError() }
        let item = content[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item is Folder ? "Folder" : "File"
        cell.imageView?.image = item is Folder ? UIImage(named: "folder") : UIImage(named: "file")

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let content = currentFolder.showContent() as? [Compose] else { fatalError() }
        
        let item = content[indexPath.row]
        
        tableViewController.currentFolder = item
        
        item is Folder ? showFolder() : print(item.showContent())
    }
    
    //Создаем новую tableView при клике на папку
    func showFolder() {
        navigationController?.pushViewController(tableViewController, animated: true)
    }

}
