package com.mgodeneche.utils;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mgodeneche.entity.ResultItem;

public class ParserUtil {
	private static final Logger logger = LoggerFactory.getLogger(ParserUtil.class);
	
	public  void parseHttpResponse(Document doc){
		Elements items = doc.select(".item_infos");
		for(Element item : items){
			parseItemInfos(item);
		}
		logger.info(items.size()+" résultats trouvés");
	}
	
	private ResultItem parseItemInfos(Element itemInfos){
		ResultItem rI = new ResultItem();
		getItemTitle(itemInfos);
		//rI.setTitle
		
		return rI;
	}
	private String getItemTitle(Element itemInfos){
		Elements items = itemInfos.select(".item_title");
		for(Element item : items){
			item.get
			logger.info(item.toString());
		}
		
		return null;
	}
}
