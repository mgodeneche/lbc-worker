package com.mgodeneche.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mgodeneche.entity.ResultItem;

public class ParserUtil {
	private static final Logger logger = LoggerFactory.getLogger(ParserUtil.class);
	public  void parseHttpResponse(String httpResponse){
		
		//String[] items = httpResponse.split("<li itemscope=\"\" itemtype=\"http://schema.org/Offer\">*</li>");
		String[] items = httpResponse.split("<section class=\"item_infos\">");
		int i =0;
		for(String item : items){
			logger.info("Résultat trouvé !");
			parseItemInfos(item);
			i++;
		}
		logger.info(i+" résultats trouvés");
	}
	
	private ResultItem parseItemInfos(String itemInfos){
		ResultItem rI = new ResultItem();
		getItemTitle(itemInfos);
		//rI.setTitle
		
		return rI;
	}
	private String getItemTitle(String itemInfos){
		String[] s = itemInfos.split("<h2 class=\"item_title\" itemprop=\"name\">");
		String uncleanedTitle = s[0];
		String[] s2 = uncleanedTitle.split("</h2>");
		String cleanedTitle = s2[0];
		//logger.info("-------------->"+uncleanedTitle);
		
		return null;
	}
}
