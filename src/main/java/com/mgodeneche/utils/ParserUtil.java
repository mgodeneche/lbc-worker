package com.mgodeneche.utils;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mgodeneche.entity.ResultItem;

public class ParserUtil {
	private final static String EMPTY ="";
	private final static String SPACE="\\s";
	private final static String EURO="€";
	private final static String ENCODED_SPACE="\u00a0";
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
		rI.setTitle(getItemTitle(itemInfos));
		rI.setPrice(getPrice(itemInfos));
		getCategory(itemInfos);
		
		
		//logger.info(rI.toString());
		return rI;
	}
	private String getItemTitle(Element itemInfos){
		Elements items = itemInfos.select(".item_title");
		for(Element item : items){
			String s = item.text();
			if(s.length()>0){
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
	private Float getPrice(Element itemInfos){
		Elements items = itemInfos.select(".item_price");
		for(Element item : items){
			String s = item.text();
			return normalizePrice(s);
	
		}
		
		return (float) 0;
	}
	private Float normalizePrice(String s){
		s = s.replaceAll(EURO,EMPTY);
		s = s.replaceAll(SPACE,EMPTY);
		s = s.replaceAll(ENCODED_SPACE,EMPTY);
		return Float.valueOf(s);
	}
}
