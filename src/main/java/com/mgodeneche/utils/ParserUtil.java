package com.mgodeneche.utils;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mgodeneche.entity.ResultItem;

public class ParserUtil {
	private final static String EMPTY ="";
	private static final Logger logger = LoggerFactory.getLogger(ParserUtil.class);
	
	public  void parseHttpResponse(Document doc){
		Elements items = doc.select(".item_infos");
		for(Element item : items){
			parseItemInfos(item);
			//logger.info(item.toString());
		}
		logger.info(items.size()+" résultats trouvés");
	}
	
	private ResultItem parseItemInfos(Element itemInfos){
		ResultItem rI = new ResultItem();
		getItemTitle(itemInfos);
		//getPrice(itemInfos);
		//getCategory(itemInfos);
		
		
		return rI;
	}
	private String getItemTitle(Element itemInfos){
		Elements items = itemInfos.select(".item_title");
		for(Element item : items){
			String s = item.text();
			if(s.length()<0){
				return s;
			}
		}
		
		return EMPTY;
	}
	private String getCategory(Element itemInfos){
		//TODO: compare with an enum ? 
		Elements items = itemInfos.select(".item_supp");
		for(Element item : items){
			String s = item.text();
			logger.info(s);
		}
		
		return EMPTY;
	}
	private String getPrice(Element itemInfos){
		Elements items = itemInfos.select(".item_price");
		for(Element item : items){
			String s = item.text();
			logger.info(s);
		}
		
		return EMPTY;
	}
}
