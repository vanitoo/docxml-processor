<?xml version="1.0" encoding="utf-8"?>
<!--Письмо ФТС от 31.03.2020 № 14-123/18557
DecisionCode = 1 - Уведомление о принятом решении о приостановлении срока выпуска товаров
DecisionCode = 3 - Уведомление о принятом решении о продлении срока приостановления срока выпуска товаров-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:davir="urn:customs.ru:Information:DecisionAboutViolationIntellectRights:5.25.0">
	<!-- Шаблон для типа DecisionAboutViolationIntellectRightsType -->
	<xsl:template match="//*[local-name()='DecisionAboutViolationIntellectRights']//*" priority="-1">
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
	<xsl:template match="davir:DecisionAboutViolationIntellectRights">
		<xsl:param name="w" select="190"/>
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

					.value
					{
					border-bottom: solid 1px black;
					font-style: italic;
					vertical-align: bottom;
					}

					.descr{
					font-size: 7pt;
					text-align: center;
					vertical-align: top;
					}

					.delim_3 {
					height: 3pt;
					}

                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
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
				<xsl:choose>
					<xsl:when test="davir:Decision/davir:DecisionCode = '1' or davir:Decision/davir:DecisionCode = '3'">
						<div class="page">
							<table width="100%">
								<tbody>
									<tr>
										<td align="center" class="value">
											<xsl:apply-templates mode="CustomsOffice" select="davir:Decision/davir:Customs"/>
										</td>
									</tr>
									<tr>
										<td class="descr">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
									</tr>
									<xsl:choose>
										<xsl:when test="davir:Decision/davir:DecisionCode = '1'">
											<tr>
												<td align="center" style="font-weight:bold;">
													<br>
														<xsl:text>Уведомление</xsl:text>
													</br>
													<br>
														<xsl:text>о принятом решении о приостановлении срока выпуска товаров</xsl:text>
													</br>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="davir:Decision/davir:DecisionCode = '3'">
											<tr>
												<td align="center" style="font-weight:bold;">
													<br>
														<xsl:text>Уведомление о принятом решении </xsl:text>
													</br>
													<br>
														<xsl:text>о продлении срока приостановления срока выпуска</xsl:text>
													</br>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td align="right" width="5%">
															<xsl:text>от  </xsl:text>
														</td>
														<td align="center" width="20%" class="value">
															<xsl:apply-templates select="davir:Decision/davir:DecisionNumber/cat_ru:PrDocumentDate" mode="date_2"/>
														</td>
														<td align="right" width="45%">
															<xsl:text>№ </xsl:text>
														</td>
														<td align="center" class="value" width="30%">
															<xsl:apply-templates select="davir:Decision/davir:DecisionNumber/cat_ru:PrDocumentNumber"/>
														</td>
													</tr>
													<tr>
														<td/>
														<td/>
														<td/>
														<td align="center" class="descr">
															<xsl:text>(проставляется таможенным органом)</xsl:text>
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
									<xsl:choose>
										<xsl:when test="davir:Decision/davir:DecisionCode = '1'">
											<tr>
												<td style="text-indent: 5%; text-align:justify">
													<xsl:text>Таможенным органом обнаружены признаки нарушения прав на объекты интеллектуальной собственности и в соответствии с законодательством Российской Федерации о таможенном регулировании </xsl:text>
													<xsl:choose>
														<xsl:when test="davir:Decision/davir:DecisionNumber/cat_ru:PrDocumentDate">
															<span class="value">
																<xsl:apply-templates select="davir:Decision/davir:DecisionNumber/cat_ru:PrDocumentDate" mode="date_2"/>
															</span>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>
													<xsl:text>  принято решение о приостановлении срока выпуска товаров до  </xsl:text>
													<xsl:choose>
														<xsl:when test="davir:GoodsWithSignOfViolation/davir:LastDate">
															<span class="value">
																<xsl:apply-templates select="davir:GoodsWithSignOfViolation/davir:LastDate" mode="date_2"/>
															</span>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="davir:Decision/davir:DecisionCode = '3'">
											<tr>
												<td style="text-indent: 5%; text-align:justify">
													<xsl:text>Таможенным органом на основании запроса правообладателя (его представителя) </xsl:text>
													<span class="value">
														<!--xsl:apply-templates mode="organization" select="davir:Declarant"/-->
														<xsl:apply-templates mode="organization" select="davir:IPOOwner[1]"/>
													</span>
													<xsl:text>  от  </xsl:text>
													<xsl:choose>
														<xsl:when test="davir:Decision/davir:OwnerDocument/cat_ru:PrDocumentDate">
															<span class="value">
																<xsl:apply-templates mode="date_2" select="davir:Decision/davir:OwnerDocument/cat_ru:PrDocumentDate"/>
															</span>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>
													<xsl:text>  №  </xsl:text>
													<xsl:choose>
														<xsl:when test="davir:Decision/davir:OwnerDocument/cat_ru:PrDocumentNumber">
															<span class="value">
																<xsl:apply-templates select="davir:Decision/davir:OwnerDocument/cat_ru:PrDocumentNumber"/>
															</span>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>
													<xsl:text>  и в соответствии с законодательством Российской Федерации о таможенном регулировании  </xsl:text>
													<xsl:choose>
														<xsl:when test="davir:Decision/davir:DecisionNumber/cat_ru:PrDocumentDate">
															<span class="value">
																<xsl:apply-templates select="davir:Decision/davir:DecisionNumber/cat_ru:PrDocumentDate" mode="date_2"/>
															</span>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>
													<xsl:text>  принято решение о продлении срока приостановления срока выпуска товаров до </xsl:text>
													<xsl:choose>
														<xsl:when test="davir:GoodsWithSignOfViolation/davir:ProlongDate">
															<span class="value">
																<xsl:apply-templates select="davir:GoodsWithSignOfViolation/davir:ProlongDate" mode="date_2"/>
															</span>
														</xsl:when>
														<xsl:otherwise>_______</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<xsl:for-each select="davir:GoodsWithSignOfViolation">
										<tr>
											<td>
												<table width="100%">
													<tbody>
														<tr>
															<td colspan="3" align="center">
																<xsl:text>Информация о товаре:</xsl:text>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="delim_3">
																<br/>
															</td>
														</tr>
														<tr>
															<td width="45%">
																<xsl:text>1. </xsl:text>
																<xsl:choose>
																	<xsl:when test="davir:Consigment">Регистрационный номер реестра экспресс грузов</xsl:when>
																	<xsl:otherwise>Декларация на товар №</xsl:otherwise>
																</xsl:choose>
																<xsl:text>:</xsl:text>
															</td>
															<td width="3%"/>
															<td class="value" width="52%">
																<xsl:apply-templates mode="DTNum" select="../davir:NumberDT"/>
																<xsl:if test="davir:Consigment">
																	<br/>
																	<xsl:text>Номер партии / накладной реестра ЭГ: </xsl:text>
																	<xsl:apply-templates select="davir:Consigment"/>
																</xsl:if>
															</td>
														</tr>
														<tr>
															<td>
																<xsl:text>2. Товар</xsl:text>
																<br>
																	<xsl:text>(наименование и описание)</xsl:text>
																</br>
															</td>
															<td/>
															<td class="value">
																<!--xsl:for-each select="davir:SignOfViolation">
																	<xsl:apply-templates select="davir:BogusProductDescription"/>
																	<xsl:if test="position()!=last()">
																		<xsl:text>,</xsl:text>
																	</xsl:if>
																</xsl:for-each-->
																<xsl:for-each select="davir:GoodsDescription">
																	<xsl:apply-templates select="."/>
																</xsl:for-each>
															</td>
														</tr>
														<tr>
															<td>
																<xsl:text>3. Номер товара:</xsl:text>
															</td>
															<td/>
															<td class="value">
																<!--xsl:for-each select="davir:GoodsDescription">
																	<xsl:apply-templates select="."/>
																</xsl:for-each-->
																<xsl:apply-templates select="davir:GoodsNumeric"/>
															</td>
														</tr>
														<tr>
															<td>
																<xsl:text>4. Место нахождения товара:</xsl:text>
															</td>
															<td/>
															<td class="value">
																<xsl:for-each select="davir:SignOfViolation/davir:Place">
																	<!--xsl:choose>
																		<xsl:when test="davir:CodePlace='05'">
																			<xsl:for-each select=".">
																				<xsl:apply-templates select="davir:Name"/>
																				<xsl:for-each select="davir:Description">
																					<xsl:apply-templates select="."/>
																				</xsl:for-each>
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose-->
																	<xsl:if test="position() != 1">;<br/></xsl:if>
																	<xsl:apply-templates select="davir:Name"/>
																	<xsl:if test="davir:Description">,</xsl:if>
																	<xsl:text> </xsl:text>
																	<xsl:apply-templates select="davir:Description"/>
																	<xsl:choose>
																		<xsl:when test="davir:CodePlace='01'"> - место ввоза легальной продукции</xsl:when>
																		<xsl:when test="davir:CodePlace='02'"> - место таможенного оформления легальной продукции</xsl:when>
																		<xsl:when test="davir:CodePlace='03'"> - место ввоза товаров, обладающих признаками контрафактных</xsl:when>
																		<xsl:when test="davir:CodePlace='04'"> - место таможенного оформления товаров, обладающих признаками контрафактных</xsl:when>
																		<xsl:when test="davir:CodePlace='05'"> - местонахождение товаров</xsl:when>
																	</xsl:choose>
																</xsl:for-each>
															</td>
														</tr>
														<tr valign="top">
															<td>
																<xsl:text>5. Декларант (наименование, место нахождения (адрес))</xsl:text>
															</td>
															<td/>
															<td class="value">
																<xsl:text>Наименование: </xsl:text>
																<xsl:apply-templates select="../davir:Declarant/cat_ru:OrganizationName"/>
																<xsl:if test="not(../davir:Declarant/cat_ru:OrganizationName)">
																	<xsl:apply-templates select="../davir:Declarant/cat_ru:ShortName"/>
																</xsl:if>
																<xsl:if test="../davir:Declarant/RUScat_ru:SubjectAddressDetails">
																	<br/>
																	<xsl:for-each select="../davir:Declarant/RUScat_ru:SubjectAddressDetails">
																		<xsl:apply-templates select="." mode="address"/>
																	</xsl:for-each>
																</xsl:if>
															</td>
														</tr>
														<tr>
															<td colspan="3" class="delim_3">
																<br/>
															</td>
														</tr>
														<xsl:for-each select="davir:SignOfViolation">
															<tr>
																<td align="center" colspan="3">
																	<xsl:text>Информация об объекте интеллектуальной собственности:</xsl:text>
																</td>
															</tr>
															<tr>
																<td colspan="3" class="delim_3">
																	<br/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:text>1. Наименование объекта интеллектуальной собственности:</xsl:text>
																</td>
																<td/>
																<td class="value">
																	<xsl:apply-templates select="davir:IPOinfo/davir:OISName"/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:text>2. Рег. № ОИС по ТРОИС: </xsl:text>
																</td>
																<td/>
																<td class="value">
																	<xsl:apply-templates select="davir:IPOinfo/davir:IntelPropertyObjectNumber/davir:IntelPropertyObjectNumber"/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:text>3. Рег. № ОИС в Роспатенте/ВОИС/иное (указать)</xsl:text>
																</td>
																<td/>
																<td class="value">
																	<xsl:apply-templates select="davir:IPOinfo/davir:IPOInfoDoc" mode="DocBase"/>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:text>4. Правообладатель, место нахождения (адрес):</xsl:text>
																</td>
																<td/>
																<td class="value">
																	<xsl:apply-templates select="../../davir:IPOOwner/cat_ru:OrganizationName"/>
																	<br/>
																	<xsl:for-each select="../../davir:IPOOwner/RUScat_ru:SubjectAddressDetails">
																		<xsl:apply-templates select="." mode="address"/>
																	</xsl:for-each>
																</td>
															</tr>
															<tr>
																<td>
																	<xsl:text>5. Представитель правообладателя, место нахождения (адрес):</xsl:text>
																</td>
																<td/>
																<td class="value">
																	<!--xsl:for-each select="../../davir:Declarant/RUScat_ru:SubjectAddressDetails">
																		<xsl:apply-templates select="." mode="address"/>
																	</xsl:for-each-->
																</td>
															</tr>
															<tr>
																<td colspan="3" class="delim_3">
																	<br/>
																</td>
															</tr>
														</xsl:for-each>
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center">
											<xsl:text>Дополнительная информация:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="bordered">
											<br/>
											<xsl:for-each select="davir:AddInfoAppText">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="15%" align="right">
															<xsl:text>Приложение: </xsl:text>
														</td>
														<td class="value" width="85%">
															<xsl:for-each select="davir:DocumentsList">
																<xsl:apply-templates select="." mode="DocBase"/>
																<xsl:if test="position()!=last()">
																	<xsl:text>, </xsl:text>
																</xsl:if>
															</xsl:for-each>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="page" style="width: {$w}mm;">
							<table>
								<tbody>
									<tr>
										<td align="center" class="title">
											<font size="4">
												<b>Информация о товарах с признаками возможного нарушении прав интеллектуальной собственности и принятом решении относительно приостановлении их выпуска </b>
											</font>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<!--table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if-->
							<xsl:if test="davir:Decision">
								<div class="title marg-top">Решение, принятое таможенным органом относительно выпуска товаров, содержащих признаки нарушения прав интеллектуальной собственности</div>
								<div>
									<xsl:apply-templates select="davir:Decision">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="davir:NumberDT">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">
											<b>Регистрационный номер ДТ / Заявления о выпуске товаров до подачи ДТ</b>
										</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="davir:NumberDT/cat_ru:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="DT_date">
												<xsl:with-param name="dateIn" select="davir:NumberDT/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:apply-templates select="davir:NumberDT/cat_ru:GTDNumber"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="davir:CustomsModeCode">
								<table>
									<tr>
										<td class="annot graphMain" style="width:50%">
											<b>Код таможенной процедуры</b>
										</td>
										<td class="value graphMain" style="width:50%">
											<xsl:apply-templates select="davir:CustomsModeCode"/>
										</td>
									</tr>
								</table>
							</xsl:if>
							<xsl:if test="davir:Declarant">
								<div class="title marg-top">Декларант товаров</div>
								<div>
									<xsl:apply-templates select="davir:Declarant">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<xsl:if test="davir:IPOOwner">
								<div class="title marg-top">Информация о правообладателе</div>
								<div>
									<xsl:apply-templates select="davir:IPOOwner">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</div>
							</xsl:if>
							<div class="title marg-top">Товары с признаками нарушения прав интеллектуальной собственности, относительно которых выносится решение</div>
							<table class="bordered">
								<tbody>
									<tr class="title">
										<xsl:if test="davir:GoodsWithSignOfViolation/davir:DecisionCode and (davir:Decision/davir:DecisionCode='*' or davir:Decision/davir:DecisionCode='3')">
											<td class="graphMain bordered" width="10%">Решение</td>
											<td class="graphMain bordered" width="5%">Код решения в соответствии с классификатором решений,  принимаемых таможенными органами </td>
										</xsl:if>
										<td class="graphMain bordered" width="5%">Номер партии товаров / накладной реестра ЭГ</td>
										<td class="graphMain bordered" width="5%">Порядковый номер декларируемого товара</td>
										<td class="graphMain bordered" width="10%">Код товара по ТН ВЭД ЕАЭС. Гр.33 первый раздел</td>
										<!--td class="graphMain bordered" width="5%">Признак объекта интеллектуальной собственности («И»). Гр.33 второй раздел  в ДТ</td-->
										<td class="graphMain bordered" width="15%">Наименование (торговое, коммерческое или иное традиционное наименование) товаров</td>
										<td class="graphMain bordered" width="36%">Регистрационный номер ОИС по таможенному реестру / Сведения о номере документа об охраноспособности ОИС в РФ</td>
										<td class="graphMain bordered" width="7%">Дата, до которой срок выпуска товаров приостановлен</td>
										<td class="graphMain bordered" width="7%">Дата, до которой продлен  срок приостановления срока выпуска товаров </td>
									</tr>
									<xsl:for-each select="davir:GoodsWithSignOfViolation">
										<xsl:apply-templates select=".">
											<xsl:with-param name="wdth" select="$w"/>
										</xsl:apply-templates>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="CustomsOffice" match="*">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> (</xsl:text>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
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
	<xsl:template mode="DocBase" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name(.)='PrDocumentName'">
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="local-name(.)='PrDocumentNumber'">
					<xsl:text> № </xsl:text>
					<xsl:apply-templates select="."/>
				</xsl:when>
				<xsl:when test="local-name(.)='PrDocumentDate'">
					<xsl:text> от </xsl:text>
					<xsl:apply-templates select="." mode="date"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:AddressKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вид адреса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="RUScat_ru:AddressKindCode='1'">
									<xsl:text>адрес регистрации</xsl:text>
								</xsl:when>
								<xsl:when test="RUScat_ru:AddressKindCode='2'">
									<xsl:text>фактический адрес</xsl:text>
								</xsl:when>
								<xsl:when test="RUScat_ru:AddressKindCode='3'">
									<xsl:text>почтовый адрес</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="RUScat_ru:AddressKindCode"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostalCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostalCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CounryName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Region"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:District"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Town"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:House"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:Room"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AddressText">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AddressText"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKTMO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OKATO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код КЛАДР</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:KLADR"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOGUID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:AOID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:Phone">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телефона</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:Phone">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Fax">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер факса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:Fax"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:Telex">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер телекса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:Telex"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:E_mail">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="cat_ru:E_mail">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CategoryCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:KATOCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:RNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ITNReserv"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUScat_ru:IdentityCardCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность. Для РФ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardSeries">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCardDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="date"/>
							<!--<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
							</xsl:call-template>-->
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:KGINN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="cat_ru:KGINN='ИНН'">
									<xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
								</xsl:when>
								<xsl:when test="cat_ru:KGINN='ПИН'">
									<xsl:text>персональный идентификационный номер</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="cat_ru:KGINN"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KGOKPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:KGOKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:UNN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:SocialServiceCertificate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:UNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:UNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RBIdentificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template mode="rf_features" match="cat_ru:RFOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OGRN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OGRN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:KPP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:KPP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:BIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:BIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:IIN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:IIN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ITN">
				<div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
				<div>
					<xsl:apply-templates select="cat_ru:ITN">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа davir:CountryType -->
	<xsl:template match="davir:CountryInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="davir:CountryName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="davir:CountryCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="davir:Priznac"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="davir:Customs">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<!--xsl:if test="cat_ru:CustomsCountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код государства - члена Евразийского экономического союза. Трехзначный цифровой код</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:CustomsCountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if-->
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="davir:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа davir:DecisionType -->
	<xsl:template match="davir:Decision">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="davir:DecisionCode='1' or davir:DecisionCode='2' or davir:DecisionCode='3' or davir:DecisionCode='*'">Тип документа</xsl:when>
							<xsl:otherwise>Код типа документа</xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="davir:DecisionCode='1'">Решение о приостановлении выпуска товаров, содержащих ОИС</xsl:when>
							<xsl:when test="davir:DecisionCode='2'">Отмена Решения о приостановлении выпуска товаров, содержащих ОИС</xsl:when>
							<xsl:when test="davir:DecisionCode='3'">Решение о продлении срока приостановления выпуска товаров, содержащих ОИС</xsl:when>
							<xsl:when test="davir:DecisionCode='*'">разные по товарам</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="davir:DecisionCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="davir:DecisionDTCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код решения в соответствии с классификатором решений,  принимаемых таможенными органами </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="davir:DecisionDTCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="davir:DecisionNumber">
				<div class="title marg-top">
					<xsl:choose>
						<xsl:when test="davir:DecisionNumber/cat_ru:PrDocumentName">
							<xsl:apply-templates select="davir:DecisionNumber/cat_ru:PrDocumentName"/>
						</xsl:when>
						<xsl:otherwise>Номер и дата принятого решения</xsl:otherwise>
					</xsl:choose>
				</div>
				<div>
					<xsl:apply-templates select="davir:DecisionNumber">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="davir:Customs">
				<div class="title marg-top">Таможенный орган, принявший решение</div>
				<div>
					<xsl:apply-templates select="davir:Customs">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="davir:CustomsPerson">
				<div class="title marg-top">Должностное лицо, таможенного органа, принявшее решение</div>
				<div>
					<xsl:apply-templates select="davir:CustomsPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="davir:Foundation">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обоснование принятого решения</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="davir:Foundation">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="davir:OwnerDocument">
				<div class="title marg-top">Сведения о документе правообладателя, если решение принято в ответ на обращение правообладателя</div>
				<div>
					<xsl:apply-templates select="davir:OwnerDocument">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="davir:PreviousDecision">
				<div class="title marg-top">Информация о предшествующем отменяемом/продлеваемом решении</div>
				<div>
					<xsl:apply-templates select="davir:PreviousDecision">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="davir:DecisionNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регистрационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<xsl:variable name="lower">
			абвгдеёжзийклмнопрстуфхцчшщъыьэюя
		</xsl:variable>
				<xsl:variable name="upper">
			АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ
		</xsl:variable>
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="cat_ru:PrDocumentName and translate(substring(cat_ru:PrDocumentName,1,11),$upper,$lower)='уведомление'">Дата уведомления</xsl:when>
								<xsl:when test="cat_ru:PrDocumentName and translate(substring(cat_ru:PrDocumentName,1,7),$upper,$lower)='решение'">Дата решения</xsl:when>
								<xsl:otherwise>Дата документа</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="date"/>
							<!--<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>-->
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUOrganizationType -->
	<xsl:template match="davir:Declarant">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates mode="rf_features" select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<div class="title marg-top">Адрес организации</div>
					<div>
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</div>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<div class="title marg-top">Документ, удостоверяющий личность</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:Contact">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="cat_ru:Contact">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа davir:GoodsType -->
	<xsl:template match="davir:GoodsWithSignOfViolation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<xsl:if test="../davir:GoodsWithSignOfViolation/davir:DecisionCode and (//davir:Decision/davir:DecisionCode='*' or //davir:Decision/davir:DecisionCode='3')">
					<td class="graphMain bordered">
						<xsl:choose>
							<xsl:when test="davir:DecisionCode='1'">
								<xsl:text>Решение о приостановлении выпуска товаров</xsl:text>
							</xsl:when>
							<xsl:when test="davir:DecisionCode='2'">
								<xsl:text>Отмена Решения о приостановлении выпуска товаров</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="davir:DecisionCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="graphMain bordered">
						<xsl:apply-templates select="davir:DecisionDTCode"/>
					</td>
				</xsl:if>
				<td class="graphMain bordered">
					<xsl:apply-templates select="davir:Consigment"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="davir:GoodsNumeric"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="davir:GoodsTNVEDCode"/>
				</td>
				<!--td class="graphMain bordered">
          <xsl:apply-templates select="davir:IntellectPropertySign" />
        </td-->
				<td class="graphMain bordered">
					<xsl:for-each select="davir:GoodsDescription">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="davir:SignOfViolation">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
						<xsl:if test="position()!=last()">
							<br/>
							<br/>
						</xsl:if>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="davir:LastDate"/>
					</xsl:call-template>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="davir:ProlongDate" mode="date"/>
					<!--<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="davir:ProlongDate"/>
					</xsl:call-template>-->
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа davir:ApplicantType -->
	<xsl:template match="davir:IPOOwner">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:OrganizationName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:ShortName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:ShortName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:OrganizationLanguage">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OrganizationLanguage"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
				<div>
					<xsl:apply-templates mode="rf_features" select="cat_ru:RFOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RKOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
				<div>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RBOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
				<div>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:RAOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
				<div>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:KGOrganizationFeatures">
				<div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
				<div>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="RUScat_ru:SubjectAddressDetails">
				<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
					<div class="title marg-top">Адрес организации</div>
					<div>
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</div>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="RUScat_ru:IdentityCard">
				<div class="title marg-top">Документ, удостоверяющий личность</div>
				<div>
					<xsl:apply-templates select="RUScat_ru:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="cat_ru:Contact">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="cat_ru:Contact">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор Заявителя/правообладателя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="davir:PersonID"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа davir:IntelPropertyObjectNumberType -->
	<!--<xsl:template match="davir:IntelPropertyObjectNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер ОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="davir:IntelPropertyObjectNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>-->
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template mode="DTNum" match="davir:NumberDT">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="DTdate"/>
		<!--<xsl:call-template name="DT_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>-->
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="davir:OwnerDocument">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<!--xsl:apply-templates select="cat_ru:RegistrationDate" mode="date"/-->
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа davir:PreviousDecisionType -->
	<xsl:template match="davir:PreviousDecision">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:RegistrationDate" mode="date"/>
							<!--<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>-->
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="davir:ObjectRegNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регистрационный номер объекта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="davir:ObjectRegNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="davir:EmissionStoppingNotificationNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер Уведомления о принятии мер, связанных с приостановкой выпуска объекта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="davir:EmissionStoppingNotificationNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="davir:EmissionStoppingNotificationDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата Уведомления о принятии мер, связанных с приостановкой выпуска объекта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="davir:EmissionStoppingNotificationDate" mode="date"/>
							<!--<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="davir:EmissionStoppingNotificationDate"/>
							</xsl:call-template>-->
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа davir:SignOfViolationType -->
	<xsl:template match="davir:SignOfViolation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
		<!--b><xsl:text>Рег.№ ОИС по реестру</xsl:text></b>
      <xsl:text>: </xsl:text-->
		<b>
			<xsl:apply-templates select="davir:IPOinfo/davir:IntelPropertyObjectNumber/davir:IntelPropertyObjectNumber"/>
		</b>
		<br/>
		<xsl:if test="davir:IPOinfo/davir:OISName">
			<xsl:apply-templates select="davir:IPOinfo/davir:OISName"/>
			<br/>
		</xsl:if>
		<xsl:if test="davir:LegalProductDescription">
			<br/>
			<xsl:text>Описание внешнего вида легальной продукции: </xsl:text>
			<xsl:apply-templates select="davir:LegalProductDescription"/>
			<br/>
		</xsl:if>
		<xsl:if test="davir:BogusProductDescription">
			<br/>
			<xsl:text>Описание внешнего вида товаров, обладающих  признаками контрафактных: </xsl:text>
			<xsl:apply-templates select="davir:BogusProductDescription"/>
			<br/>
		</xsl:if>
		<xsl:if test="davir:Place">
			<br/>
			<xsl:text>Место вывоза легальной продукции: </xsl:text>
			<xsl:variable name="cnt_Place" select="count(davir:Place)"/>
			<xsl:for-each select="davir:Place">
				<xsl:if test="position()>1">
					<xsl:text>; </xsl:text>
				</xsl:if>
				<xsl:if test="$cnt_Place &gt; 1">
					<xsl:value-of select="position()"/>
					<xsl:text>) </xsl:text>
				</xsl:if>
				<xsl:apply-templates select="davir:CodePlace"/>
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="davir:Name"/>
				<xsl:if test="davir:Description">
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="davir:Description"/>
				</xsl:if>
			</xsl:for-each>
			<br/>
		</xsl:if>
		<xsl:if test="davir:CountryInfo">
			<br/>
			<xsl:for-each select="davir:CountryInfo">
				<xsl:if test="position()>1">
					<br/>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="davir:Priznac='01'">Страна отправления легальной продукции:</xsl:when>
					<xsl:when test="davir:Priznac='02'">Страна происхождения легальной продукции:</xsl:when>
					<xsl:when test="davir:Priznac='03'">Страна отправления предположительно контрафактной продукции:</xsl:when>
					<xsl:when test="davir:Priznac='04'">Страна происхождения предположительно контрафактной продукции:</xsl:when>
					<xsl:otherwise>Код вида страны: <xsl:apply-templates select="davir:Priznac"/>,</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="davir:CountryCode"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="davir:CountryName"/>
			</xsl:for-each>
			<br/>
		</xsl:if>
		<xsl:if test="davir:OtherNote">
			<br/>
			<xsl:text>Иные замечания: </xsl:text>
			<xsl:apply-templates select="davir:OtherNote"/>
		</xsl:if>
		<!--/div-->
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">,&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">, <xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:CommunicationDetails">, контактные данные: <xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic"> по справ. </span>
			<xsl:apply-templates select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal"> УИТН</span>
		<span class="normal">: </span>
		<xsl:apply-templates select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal"> (</span>
			<span class="normal">страна </span>
			<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:apply-templates select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="identity">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='IdentityCardDate'">
					<xsl:apply-templates select="." mode="date"/>
					<!--xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template-->
				</xsl:when>
				<xsl:when test="local-name()='DocValidityDate'">
					<xsl:text>(окончание срока действия: </xsl:text>
					<xsl:apply-templates select="." mode="date"/>
					<!--xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template-->
					<xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:ITN">
		<xsl:text> (Код категория лица: </xsl:text>
		<xsl:apply-templates select="cat_ru:CategoryCode"/>
		<xsl:text> Код КАТО: </xsl:text>
		<xsl:apply-templates select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text> РНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:RNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITNReserv">
			<xsl:text> Резерв: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITNReserv"/>
		</xsl:if>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН/ПИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text> ОКПО: </xsl:text>
			<xsl:apply-templates select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text> НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text> Номер справки об отсутствии НЗОУ: </xsl:text>
			<xsl:apply-templates select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:apply-templates select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text> Идентификационный номер физического лица: </xsl:text>
			<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН: </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП: </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text> ИИН: </xsl:text>
			<xsl:apply-templates select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text> Идентификационный таможенный номер: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="date">
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
	<xsl:template match="*" mode="DTdate">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="DT_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="DT_date">
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
	<xsl:template match="*" mode="date_2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_year2">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="russian_date_year2">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
