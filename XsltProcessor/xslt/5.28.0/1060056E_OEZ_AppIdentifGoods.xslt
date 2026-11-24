<?xml version="1.0" encoding="utf-8"?>
<!--Приказ Минфина России от 13.05.2016 г. № 61н "Об утверждении Порядка совершения таможенных операций при проведении идентификации товаров Евразийского экономического союза, ввозимых на территорию особой экономической зоны с остальной части таможенной территории Евразийского экономического союза, и совершения таможенных операций при обратном вывозе таких товаров с территории особой экономической зоны на остальную часть таможенной территории Евразийского экономического союза"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0" xmlns:oag="urn:customs.ru:Information:CustomsDocuments:OEZ_AppIdentifGoods:5.28.0">
	
	<xsl:param name="OEZ_NotifReg"/>
	
	<!-- Шаблон для типа OEZ_AppIdentifGoodsType -->
	<xsl:template match="oag:OEZ_AppIdentifGoods">
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div
					{white-space: normal;}

					div.page
					{width: 180mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;
					vertical-align:bottom;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.graphLittle 
					{font-family: Arial;
					font-size: 7pt;
					text-align: center;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;
					font-size: 10pt;}

					.delim_3
					{height: 3pt;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.inlinetable
					{border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;}

					.descr
					{font-size: 8pt;
					text-align: center;}
                </style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td>
									<table class="graphMain" width="100%">
										<tbody>
											<tr>
												<td align="left" valign="top" width="50%" rowspan="4">
													<xsl:text>Заявление №</xsl:text>&#160;
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<!--xsl:value-of select="номер заявления"/-->
															<xsl:if test="$OEZ_NotifReg">
																<xsl:apply-templates select="$OEZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
															</xsl:if>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="width" select="'40%'"/>
													</xsl:call-template>
													<br/>
													<xsl:text>о проведении идентификации товаров, ввозимых на территорию особой экономической зоны</xsl:text>
												</td>
												<td align="left" valign="bottom" width="5%">в </td>
												<td align="center" width="45%" class="value">
													<xsl:apply-templates select="oag:Customs" mode="CustomsOffice"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td valign="top" class="graphLittle">
													<xsl:text>(наименование таможенного органа)</xsl:text>
												</td>
											</tr>
											<tr>
												<td align="left" valign="bottom" width="5%">от </td>
												<td align="center" width="45%" class="value">
													<xsl:apply-templates mode="organization_base" select="oag:Applicant"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="graphLittle">
													<xsl:text>(наименование/адрес организации ОГРН, ИНН, КПП или фамилия, имя, отчество для физических лиц, ИНН, ОГРНИП, сведения о документе, удостоверяющем личность физического лица, адрес по которому проживает или зарегистрировано физическое лицо)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>В целях обратного вывоза товаров Евразийского экономического союза, ввозимых (ввезенных) с остальной территории Евразийского экономического союза, прошу провести идентификацию нижеуказанного товара (товаров согласно описи на </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<!--xsl:value-of select="кол-во листов"/-->
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'7%'"/>
									</xsl:call-template>
									<xsl:text> л.), ввезенного в особую экономическую зону</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="oag:GoodsMovInformation/oag:ImportDate" mode="russian_date"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="oag:GoodsMovInformation/oag:ImportPlace"/>
											<xsl:if test="oag:GoodsMovInformation/oag:ImportPlaceName">
												<xsl:text>, </xsl:text>
												<xsl:value-of select="oag:GoodsMovInformation/oag:ImportPlaceName"/>
											</xsl:if>
											<xsl:text>, </xsl:text>
											<xsl:value-of select="oag:GoodsMovInformation/oag:TransportModeCode"/>
											<xsl:if test="oag:GoodsMovInformation/oag:TransportModeName">
												<xsl:text>, </xsl:text>
												<xsl:choose>
													<xsl:when test="oag:GoodsMovInformation/oag:TransportModeName='10'">
														<xsl:text>море</xsl:text>
													</xsl:when>
													<xsl:when test="oag:GoodsMovInformation/oag:TransportModeName='20'">
														<xsl:text>ж/д</xsl:text>
													</xsl:when>
													<xsl:when test="oag:GoodsMovInformation/oag:TransportModeName='30'">
														<xsl:text>авиа</xsl:text>
													</xsl:when>
													<xsl:when test="oag:GoodsMovInformation/oag:TransportModeName='40'">
														<xsl:text>а/м</xsl:text>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="oag:GoodsMovInformation/oag:TransportModeName"/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:if>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="oag:GoodsMovInformation/oag:TransportIdentif"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="description" select="'(дата ввоза товаров, место ввоза товаров, вид транспорта, номер рейса, номер регистрации автотранспортного средства, наименование морского судна, номер железнодорожного вагона, контейнера)'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify; text-indent: 5%">
								<td>
									<xsl:text>Предполагаемая дата вывоза товаров</xsl:text>&#160;
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="oag:GoodsMovInformation/oag:EstimatedRemovalDate" mode="russian_date"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'42%'"/>
										<xsl:with-param name="description" select="'(данные указываются, если такая информация имеется)'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify; text-indent: 5%">
								<td>
									<xsl:text>Наименование товара (торговое, коммерческое или иное традиционное наименование), серийный номер или другая маркировка производителя товаров:</xsl:text>
									<br/>
										<xsl:choose>
											<xsl:when test="count(oag:Goods) &gt; 1">
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>товары согласно описи</xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:InfoDescription">
															<xsl:apply-templates select="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:InfoDescription"/>
															<xsl:if test="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerINN or oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerKPP">
																<xsl:text>; </xsl:text>
															</xsl:if>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="width" select="'100%'"/>
													<xsl:with-param name="list" select="0"/>
												</xsl:call-template>
												<xsl:if test="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerINN or oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerKPP">
													<br/>
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:if test="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerINN">
																<xsl:text>ИНН производителя - </xsl:text>
																<xsl:apply-templates select="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerINN"/>
																<xsl:if test="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerKPP">
																	<xsl:text>; </xsl:text>
																</xsl:if>
															</xsl:if>
															<xsl:if test="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerKPP">
																<xsl:text>КПП производителя - </xsl:text>
																<xsl:apply-templates select="oag:Goods[1]/oag:GoodsGroupInformation[1]/catESAD_cu:ManufacturerKPP"/>
															</xsl:if>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'center'"/>
														<xsl:with-param name="width" select="'100%'"/>
														<xsl:with-param name="list" select="1"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:otherwise>
										</xsl:choose>
								</td>
							</tr>
							<tr style="text-align: justify; text-indent: 5%">
								<td>
									<xsl:text>описание, качество и количество товара:</xsl:text>
									<br/>
									<xsl:choose>
										<xsl:when test="count(oag:Goods) &gt; 1">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:text></xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="oag:Goods[1]/oag:GoodsDescription"/>
													<xsl:text>;</xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:for-each select="oag:Goods[1]/oag:GoodsQuantity">
														<xsl:apply-templates select="." mode="SupplementaryQuantity"/>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
													</xsl:for-each>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100%'"/>
												<xsl:with-param name="list" select="1"/>
											</xsl:call-template>		
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr style="text-align: justify; text-indent: 5%">
								<td>
									<xsl:text>способ идентификации товаров, ввезенных на территорию особой экономической зоны:</xsl:text>
									<br/>
									<xsl:choose>
										<xsl:when test="count(oag:Goods) &gt; 1">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:text></xsl:text>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="oag:Goods[1]/oag:MethodIdentify"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100%'"/>
												<xsl:with-param name="list" select="1"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr style="text-align: justify; text-indent: 5%">
								<td>
									<xsl:text>сведения об отправителе, получателе (если перевозка осуществляется по договору перевозки):</xsl:text>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="oag:Consignor" mode="organization"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="list" select="1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="oag:Consignee" mode="organization"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="list" select="1"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify; text-indent: 5%">
								<td>
									<xsl:text>представлены документы:</xsl:text>
									<xsl:for-each select="oag:DocList">
										<xsl:sort case-order="lower-first" data-type="number" order="ascending" select="oag:Position"/>
										<xsl:if test="position()!=last()">
											<br/>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="." mode="doc_base"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="position()=last()">
											<br/>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:apply-templates select="." mode="doc_base"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'100%'"/>
												<xsl:with-param name="dot" select="1"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Дата, подпись, печать (если наличие печати предусмотрено в соответствии с законодательством Российской Федерации)</xsl:text>
									<br/>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="oag:AppDate" mode="russian_date"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'20%'"/>
									</xsl:call-template>
									&#160;&#160;&#160;&#160;&#160;&#160;
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="oag:AppPerson" mode="PersonBase"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="width" select="'50%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<hr/>
								</td>
							</tr>
							<tr>
								<td style="text-align: justify">
									<xsl:text>Служебные отметки таможенного органа</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<xsl:if test="count(oag:Goods) &gt; 1">
					<div class="page">
						<table class="graphMain" width="100%">
							<tbody>
								<tr>
									<td style="text-align: center">
										<b>
											<xsl:text>Опись товаров к заявлению №</xsl:text>&#160;
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<!--xsl:value-of select="номер заявления"/-->
													<xsl:if test="$OEZ_NotifReg">
														<xsl:apply-templates select="$OEZ_NotifReg/*[local-name() = 'RegistrationNumber']" mode="reg_num"/>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="width" select="'40%'"/>
											</xsl:call-template>
										</b>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table class="graphMain" width="100%">
											<tbody>
												<tr>
													<td width="5%"/>
													<td width="25%"/>
													<td width="10%"/>
													<td width="10%"/>
													<td width="25%"/>
													<td width="15%"/>
													<td width="10%"/>
												</tr>
												<tr>
													<td class="bordered" align="center">№ п/п</td>
													<td class="bordered" align="center">Наименование товара (торговое, коммерческое или иное традиционное наименование, описание качества товара)</td>
													<td class="bordered" align="center">Количество товара</td>
													<td class="bordered" align="center">Единица измерения</td>
													<td class="bordered" align="center">Идентификационные (отличительные) признаки товара: серийный номер или другая маркировка производителя товара, цвет, форма, иные признаки товара</td>
													<td class="bordered" align="center">Способ идентификации</td>
													<td class="bordered" align="center">Примечание</td>
												</tr>
												<tr>
													<td class="bordered" align="center">1</td>
													<td class="bordered" align="center">2</td>
													<td class="bordered" align="center">3</td>
													<td class="bordered" align="center">4</td>
													<td class="bordered" align="center">5</td>
													<td class="bordered" align="center">6</td>
													<td class="bordered" align="center">7</td>
												</tr>
												<xsl:for-each select="oag:Goods">
													<tr>
														<td class="bordered">
															<xsl:apply-templates select="oag:Position"/>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="oag:GoodsDescription"/>
														</td>
														<td class="bordered">
															<xsl:for-each select="oag:GoodsQuantity">
																<xsl:if test="position()!=1"><br/></xsl:if>
																<xsl:value-of select="cat_ru:GoodsQuantity"/>
															</xsl:for-each>
														</td>
														<td class="bordered">
															<xsl:for-each select="oag:GoodsQuantity">
																<xsl:if test="position()!=1"><br/></xsl:if>
																<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
																<xsl:text> (</xsl:text>
																<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
																<xsl:text>)</xsl:text>
															</xsl:for-each>
														</td>
														<td class="bordered">
															<xsl:for-each select="oag:GoodsGroupInformation">
																<xsl:apply-templates select="."/>
																<xsl:if test="position()!=last()"><br/></xsl:if>
															</xsl:for-each>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="oag:MethodIdentify"/>
														</td>
														<td class="bordered">
															<xsl:apply-templates select="oag:Notes"/>
														</td>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify">
										<xsl:text>Дата, подпись, печать (если наличие печати предусмотрено в соответствии с законодательством Российской Федерации)</xsl:text>
										<br/>
										<br/>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="oag:AppDate" mode="russian_date"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'20%'"/>
										</xsl:call-template>
										&#160;&#160;&#160;&#160;&#160;&#160;
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="oag:AppPerson" mode="PersonBase"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="width" select="'50%'"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<hr/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify">
										<xsl:text>Служебные отметки таможенного органа</xsl:text>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number']"/>
		<xsl:if test="*[local-name() = 'DocKind']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'DocKind']"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<!--xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">N справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template-->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="organization_base" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:text> док-т, удостоверяющий личность: </xsl:text>
			<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="oag:IdentityCard">
			<xsl:text> док-т, удостоверяющий личность: </xsl:text>
			<xsl:apply-templates mode="identity" select="oag:IdentityCard"/>
		</xsl:if>
		<xsl:if test="oag:Address">
			<xsl:text> адрес: </xsl:text>
			<xsl:for-each select="oag:Address/*">
				<xsl:if test="position()!=1">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last() and not(local-name()='IdentityCardSeries')">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:if test="local-name()='IdentityCardSeries'">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:GoodsGroupInformationType -->
	<xsl:template match="oag:GoodsGroupInformation">
		<xsl:if test="position() != 1"><br/><br/></xsl:if>
		<xsl:if test="catESAD_cu:InfoDescription">
			<xsl:text> Наим. артикула: </xsl:text>
			<xsl:value-of select="catESAD_cu:InfoDescription"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Manufacturer">
			<xsl:text> Производитель: </xsl:text>
			<xsl:value-of select="catESAD_cu:Manufacturer"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerINN">
			<xsl:text> ИНН производителя: </xsl:text>
			<xsl:value-of select="catESAD_cu:ManufacturerINN"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerKPP">
			<xsl:text> КПП производителя: </xsl:text>
			<xsl:value-of select="catESAD_cu:ManufacturerKPP"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerOKATO">
			<xsl:text> ОКАТО производителя: </xsl:text>
			<xsl:value-of select="catESAD_cu:ManufacturerOKATO"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:TradeMark">
			<xsl:text> Товарный знак: </xsl:text>
			<xsl:value-of select="catESAD_cu:TradeMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ProductionPlaceName">
			<xsl:text> Наим. места происх.: </xsl:text>
			<xsl:value-of select="catESAD_cu:ProductionPlaceName"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMark">
			<xsl:text> Марка: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsModel">
			<xsl:text> Модель: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsModel"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMarking">
			<xsl:text> Артикул: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsStandard">
			<xsl:text> Стандарт: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsSort">
			<xsl:text> Сорт: </xsl:text>
			<xsl:value-of select="catESAD_cu:GoodsSort"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:WoodDescriptionDetails">
			<xsl:text> Сведения о лесоматериалах: </xsl:text>
			<xsl:apply-templates mode="WoodDescriptionDetails" select="catESAD_cu:WoodDescriptionDetails"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Dimensions">
			<xsl:text> Линейные размеры: </xsl:text>
			<xsl:apply-templates mode="Dimensions" select="catESAD_cu:Dimensions"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DateIssue">
			<xsl:text> Дата производства: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Уник. идентификатор: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"> </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsGroupQuantity">
			<xsl:text> Кол-во товара: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Уник. идентификатор: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"> </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Серийный номер, код: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"> </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:ArticleWeight">
			<xsl:text> Вес артикула: </xsl:text>
			<xsl:value-of select="catESAD_cu:ArticleWeight"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:RecordId">
			<xsl:text> Уник. идентиф. записи: </xsl:text>
			<xsl:value-of select="catESAD_cu:RecordId"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:LineNum">
			<xsl:text> № записи в группе: </xsl:text>
			<xsl:value-of select="catESAD_cu:LineNum"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:InvoicedCost">
			<xsl:text> Цена/ стоимость товарной позиции: </xsl:text>
			<xsl:value-of select="translate(catESAD_cu:InvoicedCost, '.', ',')"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:LicenseGroup">
			<xsl:text> Разреш. док-т(ы): </xsl:text>
			<xsl:for-each select="catESAD_cu:LicenseGroup">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template  mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
				<xsl:if test="local-name()='WoodSortiment'">
					<xsl:text>Наим.сортимента: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='WoodKind'">
					<xsl:text>Порода древесины: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='ProductSortName'">
					<xsl:text>Наименование сорта: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='AllowanceDetails'">
					<xsl:text>Припуск по длине, ширине, высоте: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='DeviationDetails'">
					<xsl:text>Отклонения по длине, ширине, высоте: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='catESAD_cu:DiameterRangeDetails'">
					<xsl:text>Диапазон диаметров: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select=".">
						<xsl:with-param name="separator" select="'-'"/>
					</xsl:apply-templates>
				</xsl:if>
				<xsl:if test="local-name()='ContractVolumeMeasure'">
					<xsl:text> Номинальный объем товара: </xsl:text>
					<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='FactVolumeMeasure'">
					<xsl:text> Фактический объем товара: </xsl:text>
					<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
				</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType и catESAD_cu:RangeMeasureType-->
	<xsl:template mode="Dimensions" match="*">
		<xsl:param name="separator" select="'x'"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$separator"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="catESAD_cu:LicDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:LicenseGroupType-->	
	<xsl:template match="catESAD_cu:LicenseGroup">
		<xsl:if test="catESAD_cu:LicDocument">
			<xsl:apply-templates select="catESAD_cu:LicDocument"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsNumericLic">
			<xsl:if test="catESAD_cu:LicDocument">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:text>№ п/п товара: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsNumericLic"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType-->
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType-->
	<xsl:template match="*" mode="doc_base">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> №  </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_cu:SupplementaryQuantityType и catESAD_cu:UnifiedPhysicalMeasureType-->
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text><xsl:value-of select="."/><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType-->
	<xsl:template match="*" mode="CustomsOffice">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:Code">
			<xsl:if test="cat_ru:OfficeName">
				<xsl:text> (</xsl:text>
				<xsl:value-of select="cat_ru:Code"/>
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа oag:ImportPlaceType-->
	<xsl:template match="oag:GoodsMovInformation/oag:ImportPlace">
		<xsl:choose>
			<xsl:when test=".='1'">
				<xsl:text>Аэропорт Калининград (Храброво)</xsl:text>
			</xsl:when>
			<xsl:when test=".='2'">
				<xsl:text>Морской порт Калининград, участок в г. Балтийск</xsl:text>
			</xsl:when>
			<xsl:when test=".='3'">
				<xsl:text>Морской порт Калининград, участок в г. Светлый</xsl:text>
			</xsl:when>
			<xsl:when test=".='4'">
				<xsl:text>Морской порт Калининград, участок в г. Калининград</xsl:text>
			</xsl:when>
			<xsl:when test=".='5'">
				<xsl:text>Морской терминал в г. Пионерский</xsl:text>
			</xsl:when>
			<xsl:when test=".='6'">
				<xsl:text>85 км федеральной автомобильной дороги Магадан - Якутск («Колыма»)</xsl:text>
			</xsl:when>
			<xsl:when test=".='7'">
				<xsl:text>Морской порт Магадан</xsl:text>
			</xsl:when>
			<xsl:when test=".='8'">
				<xsl:text>Аэропорт Магадан (Сокол)</xsl:text>
			</xsl:when>
			<xsl:when test=".='9'">
				<xsl:text>Комплекс зданий, сооружений и посадочная площадка для самолетов и вертолетов, предназначенные для организации воздушного движения (Магаданская область, г. Магадан, 13 км основной трассы)</xsl:text>
			</xsl:when>
			<xsl:when test=".='10'">
				<xsl:text>Аэропорт Южно-Курильск (Менделеево)</xsl:text>
			</xsl:when>
			<xsl:when test=".='11'">
				<xsl:text>Аэропорт Ясный (остров Итуруп)</xsl:text>
			</xsl:when>
			<xsl:when test=".='12'">
				<xsl:text>Морской терминал Южно-Курильск (остров Кунашир)</xsl:text>
			</xsl:when>
			<xsl:when test=".='13'">
				<xsl:text>Морской терминал Малокурильск (остров Шикотан)</xsl:text>
			</xsl:when>
			<xsl:when test=".='14'">
				<xsl:text>Морской терминал Крабозаводск (остров Шикотан)</xsl:text>
			</xsl:when>
			<xsl:when test=".='15'">
				<xsl:text>Морской терминал Курильск, бухта Ольга (остров Итуруп)</xsl:text>
			</xsl:when>
			<xsl:when test=".='16'">
				<xsl:text>Морской терминал Курильск, бухта Китовая (остров Итуруп)</xsl:text>
			</xsl:when>
			<xsl:when test=".='17'">
				<xsl:text>Морской терминал Северо-Курильск (остров Парамушир)</xsl:text>
			</xsl:when>
			<xsl:when test=".='99'">
				<xsl:text>Иное место ввоза</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Иное место ввоза</xsl:text>
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
						<xsl:value-of select="$data"/>
						<br/>
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
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='oag:OEZ_AppIdentifGoods']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
</xsl:stylesheet>
