//
//  ViewController.swift
//  ARPlanet
//
//  Created by Administrator on 16/03/2019.
//  Copyright © 2019 DoubleThunder. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let sphere = SCNSphere(radius: 5)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_jupiter.jpg")
        sphere.materials = [material]
        
        let node = SCNNode()
        node.position = SCNVector3(x: 3.0, y: 4.0, z: -9.0)
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
        node.runAction(SCNAction.rotateBy(
            x: 0,
            y: CGFloat((2*Float.pi) * 5),
            z: 0,
            duration: 360)
        )
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
