<?xml version="1.0" encoding="utf-8"?>
<!--Приказ Министерства финансов Российской Федерации от 22 декабря 2020 г. N 318н "Об установлении порядка проведения идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в товарах, изготовленных (полученных) с использованием иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны на территории Арктической зоны Российской Федерации"
DocKind=1 - Заключение о возможности идентификации (Приложение 2);                    
DocKind=2 - Заключение о невозможности идентификации (Приложение 3);                   
DocKind=3 - Запрос на представление документов и сведений (без установленной формы);         
DocKind=4 - Решение об отказе в рассмотрении Заявления (без установленной формы);       
-->
<xsl:stylesheet version="1.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:ci_stz="urn:customs.ru:Information:CustomsDocuments:ConclusionIdentifSTZ:5.28.0" xmlns:catProc_ru="urn:customs.ru:Information:ProcessingDocuments:ProcessingCommonAggregateTypes:5.28.0">
	<!-- Шаблон для типа ConclusionIdentifSTZType -->
	<xsl:template match="//*[local-name()='ci_stz:ConclusionIdentifSTZ']//*" priority="-1">
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
	<xsl:template match="ci_stz:ConclusionIdentifSTZ">
		<html>
			<head>
				<style>
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
                  vertical-align:bottom;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
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

					.graphLittle 
					{
					font-family: Arial;
					font-size: 7pt;
					text-align: center;
					}

                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;

                  }
                  

				.delim_3 {
				height: 3pt;
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
					<xsl:choose>
						<xsl:when test="ci_stz:DocKind='1'">
							<table class="graphMain" width="100%">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="40%" class="value">
															<xsl:apply-templates select="ci_stz:Customs" mode="CustomsOffice"/>
														</td>
														<td width="20%"/>
														<td width="40%" class="value">
															<xsl:for-each select="ci_stz:Declarant">
																<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
																<xsl:if test="RUScat_ru:ShortName">
																	<xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
																	<xsl:apply-templates select="RUScat_ru:ShortName"/>
																	<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="graphLittle" valign="top">Наименование таможенного органа </td>
														<td/>
														<td class="graphLittle">Наименование резидента Арктической зоны Российской Федерации или иного лица, которое вправе выступить декларантом готовой продукции при ее помещении под таможенную процедуру выпуска для внутреннего потребления
</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>ЗАКЛЮЧЕНИЕ</xsl:text>
													<br/>
													<xsl:text>о возможности идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в готовой продукции</xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td align="right" width="20%"> от </td>
														<td width="17%" class="value" align="center">
															<xsl:apply-templates mode="russian_date" select="ci_stz:ConclusionRegNumber/ci_stz:RegistrationDate"/>
														</td>
														<td width="3%"> № </td>
														<td class="value" width="35%" align="center">
															<xsl:apply-templates select="ci_stz:ConclusionRegNumber" mode="doc_num"/>
														</td>
														<td width="25%"/>
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
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="20%">1. Выдано: </td>
														<td class="value" width="80%">
															<xsl:for-each select="ci_stz:Declarant">
																<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
																<xsl:if test="RUScat_ru:ShortName">(<xsl:apply-templates select="RUScat_ru:ShortName"/>)</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="graphLittle">(полное и сокращенное (при наличии) наименование лица, являющегося резидентом Арктической зоны, или иного лица, которое вправе выступить декларантом готовой продукции при ее помещении под таможенную процедуру выпуска для внутреннего потребления)</td>
													</tr>
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
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="15%">
															<xsl:text>ИНН:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:INN"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td width="15%">
															<xsl:text>КПП:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:KPP"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td width="15%">
															<xsl:text>ОГРН:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:OGRN"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>2. Заявление об идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в готовой продукции №  </xsl:text>
											<span class="value">
												<xsl:apply-templates mode="doc_num" select="ci_stz:AppInfo/ci_stz:AppRegNum"/>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>3. Готовая продукция.</xsl:text>
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
														<td width="30%"/>
														<td width="15%"/>
														<td width="40%"/>
														<td width="15%"/>
													</tr>
													<tr>
														<td colspan="4" align="center" class="bordered">Сведения о готовой продукции </td>
													</tr>
													<tr>
														<td class="bordered" align="center">наименование товара </td>
														<td class="bordered" align="center">код товара по ТН ВЭД ЕАЭС </td>
														<td class="bordered" align="center">идентификационные признаки товара </td>
														<td class="bordered" align="center">количество товара/единица измерения</td>
													</tr>
													<tr>
														<td class="bordered" align="center">1</td>
														<td class="bordered" align="center">2</td>
														<td class="bordered" align="center">3</td>
														<td class="bordered" align="center">4</td>
													</tr>
													<xsl:for-each select="ci_stz:AppInfo/ci_stz:AppIdentifSTZ/ci_stz:FinishedGoods">
														<tr>
															<td class="bordered">
																<xsl:apply-templates select="ci_stz:GoodsDescription"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates select="ci_stz:GoodsTNVEDCode"/>
															</td>
															<td class="bordered">
																<xsl:for-each select="ci_stz:GoodsGroupInformation">
																	<xsl:apply-templates mode="goods_group" select="."/>
																	<br/>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:for-each select="ci_stz:GoodsWeight">
																	<xsl:apply-templates select="."/>кг </xsl:for-each>
																<xsl:for-each select="ci_stz:GoodsQuantity">/<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
																</xsl:for-each>
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
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>4. Иностранные товары, помещенные под таможенную процедуру свободной таможенной зоны.</xsl:text>
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
														<td width="22%"/>
														<td width="14%"/>
														<td width="12%"/>
														<td width="12%"/>
													</tr>
													<tr>
														<td class="bordered" align="center">N п/п </td>
														<td class="bordered" align="center">наименование товара </td>
														<td class="bordered" align="center">код товара по ТН ВЭД ЕАЭС </td>
														<td class="bordered" align="center">регистрационный номер декларации на товары</td>
														<td class="bordered" align="center">порядковый номер(а) товара в декларации на товары </td>
														<td class="bordered" align="center">количество товара/кг </td>
														<td class="bordered" align="center">количество товара/ единица измерения </td>
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
													<xsl:for-each select="ci_stz:AppInfo/ci_stz:AppIdentifSTZ/ci_stz:ForeignGoods">
														<tr>
															<td class="bordered">
																<xsl:apply-templates select="ci_stz:Position"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates select="ci_stz:GoodsDescription"/>
															</td>
															<td class="bordered">
																<xsl:apply-templates select="ci_stz:GoodsTNVEDCode"/>
															</td>
															<td class="bordered">
																<xsl:for-each select="ci_stz:GoodsDeclaration">
																	<xsl:apply-templates mode="decl" select="."/>
																	<xsl:if test="position()!=last()">, </xsl:if>
																	<br/>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:for-each select="ci_stz:GoodsDeclaration">
																	<xsl:for-each select="ci_stz:GoodsDeclnfo">
																		<xsl:apply-templates select="ci_stz:GoodsNumber"/>
																		<xsl:if test="position()!=last()">, </xsl:if>
																	</xsl:for-each>
																	<br/>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:for-each select="ci_stz:GoodsWeight">
																	<xsl:apply-templates select="."/>
																</xsl:for-each>
															</td>
															<td class="bordered">
																<xsl:for-each select="ci_stz:GoodsQuantity">
																	<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
																	<xsl:if test="position()!=last()">/</xsl:if>
																</xsl:for-each>
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
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>5. Способ(ы) идентификации иностранных товаров в готовой продукции.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="ci_stz:IdentificationMethod">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="35%" class="value" align="center">
															<xsl:apply-templates select="ci_stz:CustomsSignature" mode="PersonBase"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="ci_stz:ResidentSignature/ci_stz:AuthoritesDocument" mode="confirm_authority_doc"/>
														</td>
														<td width="15%"/>
														<td width="30%" class="value"/>
														<td width="20%"/>
													</tr>
													<tr>
														<td class="graphLittle" valign="top">(должность, инициалы и фамилия уполномоченного должностного лица таможенного органа) </td>
														<td/>
														<td class="graphLittle" valign="top">(подпись) </td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ci_stz:DocKind='2'">
							<table class="graphMain" width="100%">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="40%" class="value">
															<xsl:apply-templates select="ci_stz:Customs" mode="CustomsOffice"/>
														</td>
														<td width="20%"/>
														<td width="40%" class="value">
															<xsl:for-each select="ci_stz:Declarant">
																<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
																<xsl:if test="RUScat_ru:ShortName">(<xsl:apply-templates select="RUScat_ru:ShortName"/>)</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="graphLittle" valign="top">Наименование таможенного органа </td>
														<td/>
														<td class="graphLittle">Наименование резидента Арктической зоны Российской Федерации или иного лица, которое вправе выступить декларантом готовой продукции при ее помещении под таможенную процедуру выпуска для внутреннего потребления
</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>ЗАКЛЮЧЕНИЕ</xsl:text>
													<br/>
													<xsl:text>о невозможности идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в готовой продукции</xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td align="right" width="20%"> от </td>
														<td width="17%" class="value" align="center">
															<xsl:apply-templates mode="russian_date" select="ci_stz:ConclusionRegNumber/ci_stz:RegistrationDate"/>
														</td>
														<td width="3%"> № </td>
														<td class="value" width="35%" align="center">
															<xsl:apply-templates select="ci_stz:ConclusionRegNumber" mode="doc_num"/>
														</td>
														<td width="25%"/>
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
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="20%">1. Выдано: </td>
														<td class="value" width="80%">
															<xsl:for-each select="ci_stz:Declarant">
																<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
																<xsl:if test="RUScat_ru:ShortName">(<xsl:apply-templates select="RUScat_ru:ShortName"/>)</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="graphLittle">(полное и сокращенное (при наличии) наименование лица, являющегося резидентом Арктической зоны, или иного лица, которое вправе выступить декларантом готовой продукции при ее помещении под таможенную процедуру выпуска для внутреннего потребления)</td>
													</tr>
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
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="15%">
															<xsl:text>ИНН:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:INN"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td width="15%">
															<xsl:text>КПП:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:KPP"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td width="15%">
															<xsl:text>ОГРН:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:OGRN"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>2. Заявление об идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в готовой продукции № </xsl:text>
											<span class="value">
												<xsl:apply-templates mode="doc_num" select="ci_stz:AppInfo/ci_stz:AppRegNum"/>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>3. Основания (причины) невозможности идентификации иностранных товаров, помещенных под таможенную процедуру свободной таможенной зоны, в готовой продукции.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="ci_stz:RejectReason">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="35%" class="value" align="center">
															<xsl:apply-templates select="ci_stz:CustomsSignature" mode="PersonBase"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="ci_stz:ResidentSignature/ci_stz:AuthoritesDocument" mode="confirm_authority_doc"/>
														</td>
														<td width="15%"/>
														<td width="30%" class="value"/>
														<td width="20%"/>
													</tr>
													<tr>
														<td class="graphLittle" valign="top">(инициалы и фамилия уполномоченного должностного лица таможенного органа) </td>
														<td/>
														<td class="graphLittle" valign="top">(подпись) </td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ci_stz:DocKind='3'">
							<table class="graphMain" width="100%">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="40%" class="value">
															<xsl:apply-templates select="ci_stz:Customs" mode="CustomsOffice"/>
														</td>
														<td width="20%"/>
														<td width="40%" class="value">
															<xsl:for-each select="ci_stz:Declarant">
																<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
																<xsl:if test="RUScat_ru:ShortName">(<xsl:apply-templates select="RUScat_ru:ShortName"/>)</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="graphLittle" valign="top">Наименование таможенного органа </td>
														<td/>
														<td class="graphLittle">Наименование резидента Арктической зоны Российской Федерации или иного лица, которое вправе выступить декларантом готовой продукции при ее помещении под таможенную процедуру выпуска для внутреннего потребления
</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>ЗАПРОС</xsl:text>
													<br/>
													<xsl:text>на представление документов и сведений </xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td align="right" width="20%"> от </td>
														<td width="17%" class="value" align="center">
															<xsl:apply-templates mode="russian_date" select="ci_stz:ConclusionRegNumber/ci_stz:RegistrationDate"/>
														</td>
														<td width="3%"> № </td>
														<td class="value" width="35%" align="center">
															<xsl:apply-templates select="ci_stz:ConclusionRegNumber" mode="doc_num"/>
														</td>
														<td width="25%"/>
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
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td class="value">
															<xsl:for-each select="ci_stz:Declarant">
																<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
																<xsl:if test="RUScat_ru:ShortName">(<xsl:apply-templates select="RUScat_ru:ShortName"/>)</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="graphLittle">(полное и сокращенное (при наличии) наименование лица, являющегося резидентом Арктической зоны, или иного лица, которое вправе выступить декларантом готовой продукции при ее помещении под таможенную процедуру выпуска для внутреннего потребления)</td>
													</tr>
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
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="15%">
															<xsl:text>ИНН:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:INN"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td width="15%">
															<xsl:text>КПП:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:KPP"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td width="15%">
															<xsl:text>ОГРН:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:OGRN"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>Регистрационный номер Заявления об идентификации </xsl:text>
											<span class="value">
												<xsl:apply-templates mode="doc_num" select="ci_stz:AppInfo/ci_stz:AppRegNum"/>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">Перечень документов и сведений, запрашиваемых таможенным органом в соответствии с пунктом 1 статьи 340 ТК ЕАЭС</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="ci_stz:AppInfo/ci_stz:AppIdentifSTZ/ci_stz:PresentedDoc">
												<xsl:apply-templates mode="doc_base" select="."/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="55%" style="text-align: justify">
															<xsl:text>Срок представления документов</xsl:text>
														</td>
														<td width="25%" class="value">
															<xsl:apply-templates mode="russian_date" select="ci_stz:DeadlineDoc"/>
														</td>
														<td width="20%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3">
															<br/>
														</td>
													</tr>
													<tr>
														<td style="text-align: justify">
															<xsl:text>Срок продления рассмотрения Заявления </xsl:text>
														</td>
														<td class="value">
															<xsl:apply-templates mode="russian_date" select="ci_stz:ProlongTerm"/>
														</td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">Основания продления срока рассмотрения Заявления</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="ci_stz:ProlongReason">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="35%" class="value" align="center">
															<xsl:apply-templates select="ci_stz:CustomsSignature" mode="PersonBase"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="ci_stz:ResidentSignature/ci_stz:AuthoritesDocument" mode="confirm_authority_doc"/>
														</td>
														<td width="15%"/>
														<td width="30%" class="value"/>
														<td width="20%"/>
													</tr>
													<tr>
														<td class="graphLittle" valign="top">(инициалы и фамилия уполномоченного должностного лица таможенного органа) </td>
														<td/>
														<td class="graphLittle" valign="top">(подпись) </td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
						<xsl:when test="ci_stz:DocKind='4'">
							<table class="graphMain" width="100%">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="40%" class="value">
															<xsl:apply-templates select="ci_stz:Customs" mode="CustomsOffice"/>
														</td>
														<td width="20%"/>
														<td width="40%" class="value">
															<xsl:for-each select="ci_stz:Declarant">
																<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
																<xsl:if test="RUScat_ru:ShortName">(<xsl:apply-templates select="RUScat_ru:ShortName"/>)</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="graphLittle" valign="top">Наименование таможенного органа </td>
														<td/>
														<td class="graphLittle">Наименование резидента Арктической зоны Российской Федерации или иного лица, которое вправе выступить декларантом готовой продукции при ее помещении под таможенную процедуру выпуска для внутреннего потребления
</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>РЕШЕНИЕ</xsl:text>
													<br/>
													<xsl:text>об отказе в рассмотрении Заявления об идентификации </xsl:text>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td align="right" width="20%"> от </td>
														<td width="17%" class="value" align="center">
															<xsl:apply-templates mode="russian_date" select="ci_stz:ConclusionRegNumber/ci_stz:RegistrationDate"/>
														</td>
														<td width="3%"> № </td>
														<td class="value" width="35%" align="center">
															<xsl:apply-templates select="ci_stz:ConclusionRegNumber" mode="doc_num"/>
														</td>
														<td width="25%"/>
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
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td class="value">
															<xsl:for-each select="ci_stz:Declarant">
																<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
																<xsl:if test="RUScat_ru:ShortName">(<xsl:apply-templates select="RUScat_ru:ShortName"/>)</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td class="graphLittle">(полное и сокращенное (при наличии) наименование лица, являющегося резидентом Арктической зоны, или иного лица, которое вправе выступить декларантом готовой продукции при ее помещении под таможенную процедуру выпуска для внутреннего потребления)</td>
													</tr>
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
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="15%">
															<xsl:text>ИНН:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:INN"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td width="15%">
															<xsl:text>КПП:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:KPP"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td width="15%">
															<xsl:text>ОГРН:</xsl:text>
														</td>
														<td class="value" width="40%">
															<xsl:for-each select="ci_stz:Declarant/RUScat_ru:RFOrganizationFeatures">
																<xsl:apply-templates select="cat_ru:OGRN"/>
															</xsl:for-each>
														</td>
														<td width="35%"/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>Регистрационный номер Заявления об идентификации </xsl:text>
											<span class="value">
												<xsl:apply-templates mode="doc_num" select="ci_stz:AppInfo/ci_stz:AppRegNum"/>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">Причины отказа</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="ci_stz:RejectReason">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="35%" class="value" align="center">
															<xsl:apply-templates select="ci_stz:CustomsSignature" mode="PersonBase"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="ci_stz:ResidentSignature/ci_stz:AuthoritesDocument" mode="confirm_authority_doc"/>
														</td>
														<td width="15%"/>
														<td width="30%" class="value"/>
														<td width="20%"/>
													</tr>
													<tr>
														<td class="graphLittle" valign="top">(инициалы и фамилия уполномоченного должностного лица таможенного органа) </td>
														<td/>
														<td class="graphLittle" valign="top">(подпись) </td>
														<td/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:when>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="gtd_date">
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
	<xsl:template match="*" mode="decl">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="doc_num">
		<xsl:apply-templates select="ci_stz:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ci_stz:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ci_stz:Number"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ci_stz:AddNumber"/>
	</xsl:template>
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
	<xsl:template mode="goods_group" match="*">
		<xsl:if test="catESAD_cu:InfoDescription">
			<xsl:text> Наименование артикула </xsl:text>
			<xsl:apply-templates select="catESAD_cu:InfoDescription"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Manufacturer">
			<xsl:text> Производитель </xsl:text>
			<xsl:apply-templates select="catESAD_cu:Manufacturer"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:ManufacturerINN">
			<xsl:text> ИНН производителя </xsl:text>
			<xsl:apply-templates select="catESAD_cu:ManufacturerINN"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:TradeMark">
			<xsl:text> Тов.знак </xsl:text>
			<xsl:apply-templates select="catESAD_cu:TradeMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMark">
			<xsl:text> Торг. знак, марка </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMark"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsModel">
			<xsl:text> Модель </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsModel"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsMarking">
			<xsl:text> Артикул</xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsStandard">
			<xsl:text> Стандарт </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsStandard"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsSort">
			<xsl:text> Сорт: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:GoodsSort"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:WoodDescriptionDetails">
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment">
				<xsl:text> Наим.сортимента: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodSortiment"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind">
				<xsl:text> Порода древесины: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:WoodKind"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName">
				<xsl:text> Наименование сорта:</xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ProductSortName"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails">
				<xsl:text> Припуск по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="size_details" select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:AllowanceDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails">
				<xsl:text> Отклонения по длине, ширине, высоте: </xsl:text>
				<xsl:apply-templates mode="size_details" select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DeviationDetails"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails">
				<xsl:text> Диапазон диаметров: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MinRangeMeasure" mode="SupplementaryQuantity"/>
				<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure"> - <xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:DiameterRangeDetails/catESAD_cu:MaxRangeMeasure" mode="SupplementaryQuantity"/>
				</xsl:if>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure">
				<xsl:text> Номинальный объем товара: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:ContractVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
			<xsl:if test="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure">
				<xsl:text> Фактический объем товара: </xsl:text>
				<xsl:apply-templates select="catESAD_cu:WoodDescriptionDetails/catESAD_cu:FactVolumeMeasure" mode="SupplementaryQuantity"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="catESAD_cu:Dimensions">
			<xsl:text> Размеры </xsl:text>
			<xsl:apply-templates mode="size_details" select="catESAD_cu:Dimensions"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:DateIssue">
			<xsl:text> Дата выпуска </xsl:text>
			<xsl:apply-templates select="catESAD_cu:DateIssue" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:SerialNumber">
			<xsl:text> Серийный номер: </xsl:text>
			<xsl:for-each select="catESAD_cu:SerialNumber">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="catESAD_cu:GoodsGroupQuantity">
			<xsl:text> Кол-во </xsl:text>
			<xsl:for-each select="catESAD_cu:GoodsGroupQuantity">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
				<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
					<xsl:text> (</xsl:text>
					<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="size_details" match="*">
		<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:LengthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)<xsl:if test="catESAD_cu:WidthMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:WidthMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
		<xsl:if test="catESAD_cu:HeightMeasure">
			<xsl:if test="catESAD_cu:LengthMeasure or catESAD_cu:WidthMeasure">
				<xsl:text> x </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasuredAmount"/>&#160;<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierName"/> (<xsl:apply-templates select="catESAD_cu:HeightMeasure/catESAD_cu:MeasureUnitQualifierCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">(<xsl:apply-templates select="."/>)</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="Certificate">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='CertificateDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='CertificateValidity'">
					<xsl:text>(срок действия: до   </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
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
			<xsl:value-of select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
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
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
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
	</xsl:template>
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
	<xsl:template mode="Contact" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email: <xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">,&#032;</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="organization_base" match="*">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="RUScat_ru:ShortName">
			<xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="RUScat_ru:ShortName"/>
			<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="RUScat_ru:ShortName">
			<xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
			<xsl:apply-templates select="RUScat_ru:ShortName"/>
			<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="ru_address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="ci_stz:ResidentCertificate">
			<xsl:text> свидетельство  </xsl:text>
			<xsl:for-each select="ci_stz:ResidentCertificate">
				<xsl:apply-templates select="." mode="Certificate"/>
				<xsl:if test="position()!=last()">
					<xsl:text>,</xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="confirm_authority_doc">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='PrDocumentNumber'">
					<xsl:text> №  </xsl:text>
				</xsl:when>
				<xsl:when test="local-name()='PrDocumentDate'">
					<xsl:text> от </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="local-name()='ComplationAuthorityDate'">
					<xsl:text>(дата окончания полномочий:   </xsl:text>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
					<xsl:text>)</xsl:text>
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
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position() > 1">
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:apply-templates select="."/>
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
	<xsl:template match="*" mode="date_str">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="date_str">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="date_str">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:choose>
							<xsl:when test="substring($date,1,2)">
								<xsl:value-of select="substring($date,1,2)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>20</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г. </td>
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
</xsl:stylesheet>
