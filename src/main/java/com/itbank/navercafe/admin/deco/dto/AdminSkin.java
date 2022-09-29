package com.itbank.navercafe.admin.deco.dto;

import java.util.ArrayList;
import java.util.List;

public class AdminSkin {
	private List<String> skinList;
	private String[] skins = {"default", "asphalt", "blue", "brown", "mustard", "pomegranate", "turquoise", "yellow"};
	
	public AdminSkin() {
		this.skinList = new ArrayList<>();
		
		for(String skin : skins) {
			skinList.add(skin);
		}
	}
	
	public List<String> getSkinList() {
		return skinList;
	}
	public void setSkinList(List<String> skinList) {
		this.skinList = skinList;
	}
	public String[] getSkins() {
		return skins;
	}
	public void setSkins(String[] skins) {
		this.skins = skins;
	}
}
