<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru rid" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:rid="urn:customs.ru:Information:CustomsDocuments:ReqInventoryDoc:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<html>
			<head>
				<style type="text/css">

					body {
					background: #cccccc;
					font-family: Arial;
					}

					div
					{
					white-space: normal;
					}
					
					div.page {
					width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}
					
					.marg-top
					{
					margin-top:5mm;
					}
					
					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}
					
					table.border tr td
					{
					border: 1px solid windowtext;
					}
					
					.value
					{
					border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;
					}
					
					.annot
					{
					font-family: Arial;
					font-size: 11pt;
					}
					
					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					}
					
					.title
					{
					font-weight:bold;
					font-family: Arial;
					font-size: 11pt;
					}
						
					tr.title td
					{
					font-weight:bold;
					font-family: Arial;
					font-size: 9pt;
					}
					
					.delim_3 {
					height: 3pt;
					}
					
					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display: -moz-inline-stack;/*Firefox 2*/
					display: inline-table; /*Хорошие браузеры*/
					_overflow: hidden;/*IE6, IE7*/
					*zoom: 1;/*включаем hasLayout для IE6, IE7*/
					*display: inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}
					
					.descr
					{font-size: 7pt;
					text-align: center;
					vertical-align:top;}
					
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}
					
					.graphMain
					{
					font-family: Arial;
					font-size: 11pt;
					}
					
					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="rid:ReqInventoryDoc/rid:DocSign='0' or rid:ReqInventoryDoc/rid:DocSign='2'">
						<table border="1">
							<tbody>
								<tr>
									<td align="center" width="138">
										<br>
											<xsl:for-each select="rid:ReqInventoryDoc">
												<xsl:for-each select="rid:SendDate">
													<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
													<xsl:text disable-output-escaping="yes">.</xsl:text>
													<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
													<xsl:text disable-output-escaping="yes">.</xsl:text>
													<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
												</xsl:for-each>
											</xsl:for-each>
										</br>
										<br>
											<xsl:for-each select="rid:ReqInventoryDoc/rid:SendTime">
												<xsl:value-of select="substring(., 1, 8)"/>
											</xsl:for-each>
										</br>
									</td>
								</tr>
								<tr>
									<td align="center" width="138">№ запроса: <xsl:for-each select="rid:ReqInventoryDoc">
											<xsl:for-each select="rid:RequestNumber">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
						<table border="0" width="100%">
							<tr>
								<td align="center">
									<span style="font-size:large; font-weight:bold; ">Запрос</span>
									<br/>
									<span style="font-size:medium; font-weight:bold; ">
										<xsl:choose>
											<xsl:when test="rid:ReqInventoryDoc/rid:DocType = 0 or not(rid:ReqInventoryDoc/rid:DocType)">
												<xsl:text>о представлении документов</xsl:text>
											</xsl:when>
											<xsl:when test="rid:ReqInventoryDoc/rid:DocType = 1">
												<xsl:text>о предоставлении документов ФОИВ</xsl:text>
											</xsl:when>
											<xsl:when test="rid:ReqInventoryDoc/rid:DocType = 2">
												<xsl:text>сканированных документов из внешнего ТО</xsl:text>
											</xsl:when>
											<xsl:when test="rid:ReqInventoryDoc/rid:DocType = 3">
												<xsl:text>о предоставлении оригинала документа</xsl:text>
											</xsl:when>
										</xsl:choose>
									 </span>
								</td>
							</tr>
							<tr>
								<td align="center" style="text-decoration:underline; ">от 
								<xsl:for-each select="rid:ReqInventoryDoc">
										<xsl:for-each select="rid:RequestDate">
											<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
										</xsl:for-each>
									 
									<xsl:for-each select="rid:RequestTime">
											<xsl:value-of select="substring(., 1, 8)"/>
										</xsl:for-each>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
						</table>
						<br/>
						<table border="0" width="100%">
							<tr>
								<td width="131">
									<table border="1">
										<tr>
											<td align="center" width="110">
												<xsl:for-each select="rid:ReqInventoryDoc">
													<xsl:for-each select="rid:Customs">
														<xsl:for-each select="cat_ru:Code">
															<xsl:apply-templates/>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<table border="1">
										<tr>
											<td align="center" height="22" width="371">
												<xsl:for-each select="rid:ReqInventoryDoc">
													<xsl:for-each select="rid:Customs">
														<xsl:for-each select="cat_ru:OfficeName">
															<xsl:apply-templates/>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<br/>
						<xsl:if test="string-length(  rid:ReqInventoryDoc/rid:GTDNumber/cat_ru:CustomsCode  )  != 0">Декларация № <xsl:for-each select="rid:ReqInventoryDoc">
								<xsl:for-each select="rid:GTDNumber">
									<xsl:for-each select="cat_ru:CustomsCode">
										<xsl:apply-templates/>
									</xsl:for-each>/<xsl:for-each select="cat_ru:RegistrationDate">
										<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
									</xsl:for-each>
									<xsl:for-each select="cat_ru:RegistrationDate">
										<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
									</xsl:for-each>
									<xsl:for-each select="cat_ru:RegistrationDate">
										<xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
									</xsl:for-each>/<xsl:for-each select="cat_ru:GTDNumber">
										<xsl:apply-templates/>
									</xsl:for-each>, </xsl:for-each>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="rid:ReqInventoryDoc/rid:PrevGTDNumber/cat_ru:CustomsCode">
							<br/>
							<xsl:text>Номер предшествующей ДТ </xsl:text>
							<xsl:for-each select="rid:ReqInventoryDoc/rid:PrevGTDNumber">
								<xsl:for-each select="cat_ru:CustomsCode">
									<xsl:apply-templates/>
								</xsl:for-each>/<xsl:for-each select="cat_ru:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
								</xsl:for-each>
								<xsl:for-each select="cat_ru:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
								</xsl:for-each>
								<xsl:for-each select="cat_ru:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
								</xsl:for-each>/<xsl:for-each select="cat_ru:GTDNumber">
									<xsl:apply-templates/>
								</xsl:for-each>, 
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="rid:ReqInventoryDoc/rid:OEZ_RegistrationNumber">
							<br/>
							Уведомление  № <xsl:for-each select="rid:ReqInventoryDoc">
								<xsl:for-each select="rid:OEZ_RegistrationNumber">
									<xsl:value-of select="rid:CustomsCode"/>
								  /
								 <xsl:for-each select="rid:RegistrationDate">
										<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
									</xsl:for-each>
									<xsl:for-each select="rid:RegistrationDate">
										<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
									</xsl:for-each>
									<xsl:for-each select="rid:RegistrationDate">
										<xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
									</xsl:for-each>/
								<xsl:value-of select="rid:Number"/>
									, </xsl:for-each>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="rid:ReqInventoryDoc/rid:INN_Declarant">
							<br/>
							<xsl:text>ИНН декларанта </xsl:text>
							<xsl:value-of select="rid:ReqInventoryDoc/rid:INN_Declarant"/>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<br/>
						<br/>
							<xsl:choose>
								<xsl:when test="rid:ReqInventoryDoc[rid:DocType = 0 or rid:DocType = 3 or not(rid:DocType)]">
									Вам необходимо в срок до 
									<xsl:for-each select="rid:ReqInventoryDoc">
										<xsl:for-each select="rid:DateLimit">
											<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
										</xsl:for-each>
									</xsl:for-each>  предоставить следующие документы:<br/>
								</xsl:when>
								<xsl:when test="rid:ReqInventoryDoc[rid:DocType = 2 or rid:DocType = 3]">
									Предоставить оригиналы следующих документов:<br/>
								</xsl:when>
							</xsl:choose>
						
						<br/>
						<xsl:for-each select="rid:ReqInventoryDoc">
							<table border="1">
								<tbody>
									<xsl:for-each select="rid:RequestedDoc">
										<tr>
											<td height="17" valign="top" width="493">
												<xsl:for-each select="rid:Position">
													<xsl:apply-templates/>
												</xsl:for-each>. <xsl:for-each select="cat_ru:PrDocumentName">
													<xsl:apply-templates/>
												</xsl:for-each> <xsl:if test="string-length(  rid:DocCode  )  != 0">(код <xsl:for-each select="rid:DocCode">
														<xsl:apply-templates/>
													</xsl:for-each>) </xsl:if>
												<xsl:if test="string-length(  cat_ru:PrDocumentNumber  )  != 0">№ <xsl:for-each select="cat_ru:PrDocumentNumber">
														<xsl:apply-templates/>
													</xsl:for-each>
												</xsl:if> <xsl:if test="string-length(  cat_ru:PrDocumentDate  )  != 0">от <xsl:for-each select="cat_ru:PrDocumentDate">
														<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
														<xsl:text disable-output-escaping="yes">.</xsl:text>
														<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
														<xsl:text disable-output-escaping="yes">.</xsl:text>
														<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
													</xsl:for-each>
												</xsl:if>
												<!--xsl:if test="rid:CountryCode">
													<xsl:text> код страны, выдавшей документ - </xsl:text>
													<xsl:value-of select="rid:CountryCode"/>
												</xsl:if-->
												<!--xsl:if test="rid:CommKind">
													<xsl:text> </xsl:text>
													<xsl:choose>
														<xsl:when test="rid:CommKind='0'">документ из архива декларанта</xsl:when>
														<xsl:when test="rid:CommKind='1'">представление оригинала документа, в том числе сканирование в ТО</xsl:when>
													</xsl:choose>
												</xsl:if-->
												<br/>
												<table border="0" width="100%">
													<tbody>
														<tr>
															<td>
																<xsl:if test="(string-length(  rid:ArchDeclID  )   !=  0 ) or   (string-length(  rid:ArchID  ) !=  0) or  (string-length(   rid:ArchDocID  )  !=  0)  or    (string-length(   rid:ADocumentID  )  !=  0)">
																	<xsl:if test="string-length(  rid:ArchDeclID  )  != 0">Уникальный идентификатор декларанта в Электронном Архиве Декларанта: <xsl:for-each select="rid:ArchDeclID">
																			<xsl:apply-templates/>
																		</xsl:for-each>
																	</xsl:if>
																	<br/>
																	<xsl:if test="string-length(  rid:ArchID  )  != 0">Уникальный идентификатор архива декларанта: <xsl:for-each select="rid:ArchID">
																			<xsl:apply-templates/>
																		</xsl:for-each>
																	</xsl:if>
																	<br/>
																	<xsl:if test="string-length(  rid:ArchDocID  )  != 0">Уникальный архивный идентификатор документа: <xsl:for-each select="rid:ArchDocID">
																			<xsl:apply-templates/>
																		</xsl:for-each>
																	</xsl:if>
																	<br/>
																	<xsl:if test="string-length(  rid:ADocumentID  )  != 0">Уникальный идентификатор документа: <xsl:for-each select="rid:ADocumentID">
																			<xsl:apply-templates/>
																		</xsl:for-each>
																	</xsl:if>
																</xsl:if>
															</td>
														</tr>
													</tbody>
												</table>
												<xsl:if test="rid:Preferencii">
													<xsl:text>Преференции: </xsl:text>
													<xsl:apply-templates select="rid:Preferencii"/>
												</xsl:if>
												<xsl:if test="rid:GoodsNumeric">
													<br/>
													<xsl:text>Порядковый номер декларируемого товара: </xsl:text>
													<xsl:value-of select="rid:GoodsNumeric"/>
												</xsl:if>
											</td>
											<td height="17" valign="top" width="258">
									  Запрашивает: <xsl:for-each select="rid:RequestorName">
													<xsl:apply-templates/>
												</xsl:for-each>
												<br/>
												<br/>
												<xsl:if test="string-length(  rid:ReqPurpose  )  != 0">
										 Цель запроса: <xsl:for-each select="rid:ReqPurpose">
														<xsl:apply-templates/>
													</xsl:for-each>
												</xsl:if>
												<br/>
												<xsl:if test="string-length(  rid:Note  )  != 0">
										 Примечание: <xsl:for-each select="rid:Note">
														<xsl:apply-templates/>
													</xsl:for-each>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
						<br/>
						<br/>
						<table border="0" width="100%">
							<tbody>
								<tr>
									<td align="center" width="422">
										<xsl:for-each select="rid:ReqInventoryDoc">
											<xsl:for-each select="rid:CustomsPerson">
												<xsl:for-each select="cat_ru:PersonName">
													<xsl:apply-templates/>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
									<td width="123"/>
									<td align="center">
										<xsl:for-each select="rid:ReqInventoryDoc">
											<xsl:for-each select="rid:CustomsPerson">
												<xsl:for-each select="cat_ru:LNP">
													<xsl:apply-templates/>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td align="center" width="422">
										<hr color="black" size="1"/>Уполномоченное должностное лицо таможенного органа</td>
									<td width="123"/>
									<td align="center">
										<hr color="black" size="1"/>ЛНП</td>
								</tr>
							</tbody>
						</table>
						<br/>   <br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
					</xsl:if>
					<xsl:if test="rid:ReqInventoryDoc/rid:DocSign='1'">
						<table border="0" class="font-size:12pt;" width="100%">
							<tbody>
								<tr>
									<td width="50%">
										<xsl:for-each select="rid:ReqInventoryDoc">
											<xsl:for-each select="rid:Customs">
												<xsl:for-each select="cat_ru:OfficeName">
													<xsl:apply-templates/>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
									<td width="50%">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								</tr>
								<tr>
									<td align="center" colspan="2">
										<b>ЗАПРОС <br/> о представлении недостающих документов и сведений</b>
									</td>
								</tr>
								<tr>
									<td align="center" colspan="2">
							от  <xsl:for-each select="rid:ReqInventoryDoc">
											<xsl:for-each select="rid:RequestDate">
												<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
												<xsl:text disable-output-escaping="yes">.</xsl:text>
												<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
												<xsl:text disable-output-escaping="yes">.</xsl:text>
												<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
											</xsl:for-each> № <xsl:value-of select="rid:RequestNumber"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								</tr>
								<tr>
									<td colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></td>
								</tr>
								<tr>
									<td style="text-align: justify" colspan="2"> 
										<xsl:text>Рассмотрев Заявление на уничтожение товаров, пришедших в негодность, и (или) упаковки на (вне) территории ОЭЗ № </xsl:text>
										<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="rid:ReqInventoryDoc/rid:OEZ_RegistrationNumber"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(регистрационный номер Заявления)'"/>
												<xsl:with-param name="width" select="'80mm'"/>
												<xsl:with-param name="comma"/>
											</xsl:call-template>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<!--<xsl:for-each select="rid:ReqInventoryDoc">
												<xsl:for-each select="rid:OEZ_RegistrationNumber">
													<xsl:value-of select="rid:CustomsCode"/>/
	
	 <xsl:for-each select="rid:RegistrationDate">
														<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
														<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
														<xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
													</xsl:for-each>/
	<xsl:value-of select="rid:Number"/>
												</xsl:for-each>
											</xsl:for-each>-->
										<xsl:text>сообщаем,  что Вам необходимо представить в уполномоченный таможенный орган следующие  документы  и сведения, необходимые для принятия решения о выдаче разрешения  на  уничтожение,  пришедших  в  негодность, и (или) упаковки на территории  ОЭЗ  или  вывоз  таких  товаров  и  (или)  упаковки  в целях их уничтожения за пределы территории ОЭЗ:</xsl:text>
									</td>
								</tr>
								<xsl:for-each select="rid:ReqInventoryDoc/rid:RequestedDoc">
									<tr>
										<td style="border-bottom: solid 1px black;" colspan="2">
											<xsl:value-of select="cat_ru:PrDocumentName"/>
											<xsl:text> № </xsl:text>
											<xsl:value-of select="cat_ru:PrDocumentNumber"/>	
								от
								<xsl:for-each select="cat_ru:PrDocumentDate">
												<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
												<xsl:text disable-output-escaping="yes">.</xsl:text>
												<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
												<xsl:text disable-output-escaping="yes">.</xsl:text>
												<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
											</xsl:for-each>
											<!--xsl:if test="rid:CountryCode">
												<xsl:text> код страны, выдавшей документ - </xsl:text>
												<xsl:value-of select="rid:CountryCode"/>
												<xsl:if test="rid:GoodsNumeric">,</xsl:if>
											</xsl:if-->
											<xsl:if test="rid:GoodsNumeric"> номер декларируемого товара: <xsl:value-of select="rid:GoodsNumeric"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td colspan="2">
										<br/>
										<br/>
			Срок представления документов до 
			<u>
											<xsl:for-each select="rid:ReqInventoryDoc/rid:DateLimit">
												<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
												<xsl:text disable-output-escaping="yes">.</xsl:text>
												<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
												<xsl:text disable-output-escaping="yes">.</xsl:text>
												<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
											</xsl:for-each>
										</u>
									</td>
								</tr>
							</tbody>
						</table>
						<br/><br/>
						<table border="0" width="100%">
							<tr>
								<td style="border-bottom: solid 1px black;" align="center" width="40%">
									<xsl:for-each select="rid:ReqInventoryDoc/rid:CustomsPerson">
										<xsl:value-of select="cat_ru:PersonName"/>
									</xsl:for-each>
								</td>
								<td width="5%">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="border-bottom: solid 1px black;" width="25%">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td width="5%">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td style="border-bottom: solid 1px black;" align="center" width="25%">
									<xsl:for-each select="rid:ReqInventoryDoc/rid:CustomsPerson">
										<xsl:value-of select="cat_ru:LNP"/>
										<xsl:if test="cat_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="cat_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="descr" width="40%">(инициалы и фамилия уполномоченного должностного лица таможенного органа)</td>
								<td width="5%">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" class="descr" width="25%">(подпись)</td>
								<td width="5%">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
								<td align="center" class="descr" width="25%">ЛНП</td>
							</tr>
						</table>
						<br/>   <br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="rid:Preferencii">
		<xsl:if test="catESAD_cu:CustomsTax">
			<br/>
			<xsl:text>&#160;&#160;&#160;&#160;Таможенные сборы </xsl:text>
			<xsl:value-of select="catESAD_cu:CustomsTax"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:CustomsDuty">
			<br/>
			<xsl:text>&#160;&#160;&#160;&#160;Таможенная пошлина </xsl:text>
			<xsl:value-of select="catESAD_cu:CustomsDuty"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Excise">
			<br/>
			<xsl:text>&#160;&#160;&#160;&#160;Акцизы </xsl:text>
			<xsl:value-of select="catESAD_cu:Excise"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Rate">
			<br/>
			<xsl:text>&#160;&#160;&#160;&#160;НДС </xsl:text>
			<xsl:value-of select="catESAD_cu:Rate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rid:OEZ_RegistrationNumber">
		<xsl:value-of select="rid:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="rid:RegistrationDate"/>
		</xsl:call-template>/<xsl:value-of select="rid:Number"/> ЗУН
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="$data"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
