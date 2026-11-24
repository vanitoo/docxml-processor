<?xml version="1.0" encoding="utf-8"?>
<!--Письмо ФТС от 31.03.2020 № 14-123/18557
DecisionCode = 01 – Уведомление о вынесенном решении о включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности (Форма 6)
DecisionCode = 02 – Уведомление о вынесенном решении о внесении изменений в таможенный реестр объектов интеллектуальной собственности (Форма 9)
DecisionCode = 03 – Уведомление о вынесенном решении об исключении объекта интеллектуальной собственности из таможенного реестра объектов интеллектуальной собственности (Форма 12)
DecisionCode = 05 – Уведомление о вынесенном решении о продлении срока включения объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности (Форма 8)
DecisionCode = 06 – Уведомление о вынесенном решении об отказе во внесении изменений в таможенный реестр объектов интеллектуальной собственности (Форма 10)
DecisionCode = 07 – Уведомление о вынесенном решении об отказе во включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности (Форма 11)
DecisionCode = 08 – Уведомление о проведении проверки информации, содержащейся в обращении об изменении сведений, указанных в заявлении о включении ОИС в реестр, либо прилагаемых к нему документах (Форма 5)
DecisionCode = 09 – Уведомление о вынесенном предварительном решении о включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности (Форма 7)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:IntPD="urn:customs.ru:IntellectualPropertyDecision:5.24.0">
	<!-- Шаблон для типа IntellectualPropertyDecisionType -->
	<xsl:template match="//*[local-name()='IntellectualPropertyDecision']//*" priority="-1">
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
	<xsl:template match="IntPD:IntellectualPropertyDecision">
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

									div.page_auto {
									width: 287mm;
									max-width: 287mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm 5mm 10mm 5mm;
									background: #ffffff;
									border: solid 1pt #000000;
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
									border: 1px solid gray;
									}

									.graph {
									font-family: Arial;
									font-size: 10pt;
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

									div.title, tr.title td { font-weight:bold;  }
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
				<div class="page">
					<table width="100%">
						<tbody>
							<xsl:choose>
								<xsl:when test="IntPD:Decision/IntPD:DecisionCode = '08'">
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br>
												<xsl:text>Уведомление</xsl:text>
											</br>
											<br>
												<xsl:text>о проведении проверки информации, содержащейся в обращении об изменении сведений, указанных в заявлении о включении ОИС в Реестр, либо прилагаемых к нему документах</xsl:text>
											</br>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>В соответствии с Таможенным кодексом Евразийского экономического союза, положениями части 6 статьи 332 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" ФТС России уведомляет о следующем.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:ApplicationInfo/cat_ru:PrDocumentName|IntPD:ApplicationInfo/cat_ru:PrDocumentNumber|IntPD:ApplicationInfo/cat_ru:PrDocumentDate">
													<span class="value">
														<xsl:apply-templates select="IntPD:ApplicationInfo" mode="DocBase"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> вынесено решение от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionDate">
													<span class="value">
														<xsl:apply-templates mode="date" select="IntPD:Decision/IntPD:DecisionDate"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text>  №  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionNumber">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:DecisionNumber"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> о проведении проверки информации в отношении объекта интеллектуальной собственности  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo|IntPD:Decision/IntPD:NumReestr">
													<span class="value">
														<xsl:for-each select="IntPD:Decision/IntPD:NumReestr">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:for-each select="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo">
															<xsl:if test="IntPD:ObjectRegNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="IntPD:ObjectRegNumber"/>
															</xsl:if>
															<xsl:apply-templates select="." mode="IntellectualPropertyDecisionShort"/>
														</xsl:for-each>
													</span>
												</xsl:when>
												<xsl:otherwise>________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> , включенного в таможенный реестр объектов интеллектуальной собственности.</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="IntPD:Decision/IntPD:DecisionCode = '01'">
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br>
												<xsl:text>Уведомление</xsl:text>
											</br>
											<br>
												<xsl:text> о вынесенном решении о включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности</xsl:text>
											</br>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>В соответствии с Таможенным кодексом Евразийского экономического союза, статьи 328 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" (далее - Федеральный закон)  ФТС России уведомляет о следующем.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании Вашего заявления от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:ApplicationInfo/cat_ru:PrDocumentDate">
													<span class="value">
														<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentDate" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_________</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber"/>
												</span>
											</xsl:if>
											<xsl:text> вынесено решение от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionDate">
													<span class="value">
														<xsl:apply-templates mode="date" select="IntPD:Decision/IntPD:DecisionDate"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text>  №  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionNumber">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:DecisionNumber"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> о включении в таможенный реестр объектов интеллектуальной собственности объекта интеллектуальной собственности </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo|IntPD:Decision/IntPD:NumReestr">
													<span class="value">
														<xsl:for-each select="IntPD:Decision/IntPD:NumReestr">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:for-each select="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo">
															<xsl:if test="IntPD:ObjectRegNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="IntPD:ObjectRegNumber"/>
															</xsl:if>
															<xsl:apply-templates select="." mode="IntellectualPropertyDecisionShort"/>
														</xsl:for-each>
													</span>
												</xsl:when>
												<xsl:otherwise>________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> компании </xsl:text>
											<span class="value">
												<xsl:apply-templates select="IntPD:Applicant" mode="organization"/>
											</span>
											<xsl:text> на срок до </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:InclusionPeriod">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:InclusionPeriod" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>_________</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>Согласно части 1 статьи 332 Федерального закона обращаем внимание на необходимость своевременного информирования ФТС России об изменении сведений, указанных в заявлении либо в прилагаемых к нему документах.</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="IntPD:Decision/IntPD:DecisionCode = '09'">
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br>
												<xsl:text>Уведомление</xsl:text>
											</br>
											<br>
												<xsl:text>о вынесенном предварительном решении о включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности</xsl:text>
											</br>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>В соответствии с Таможенным кодексом Евразийского экономического союза, положениями статьи 330 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" (далее - Федеральный закон)  ФТС России уведомляет о следующем.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании Вашего заявления от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:ApplicationInfo/cat_ru:PrDocumentDate">
													<span class="value">
														<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentDate" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_________</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber"/>
												</span>
											</xsl:if>
											<xsl:text> вынесено предварительное решение от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionDate">
													<span class="value">
														<xsl:apply-templates mode="date" select="IntPD:Decision/IntPD:DecisionDate"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text>  №  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionNumber">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:DecisionNumber"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> о включении в таможенный реестр объектов интеллектуальной собственности товарного знака</xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo|IntPD:Decision/IntPD:NumReestr">
													<span class="value">
														<xsl:for-each select="IntPD:Decision/IntPD:NumReestr">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:for-each select="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo">
															<xsl:if test="IntPD:ObjectRegNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="IntPD:ObjectRegNumber"/>
															</xsl:if>
															<xsl:apply-templates select="." mode="IntellectualPropertyDecisionShort"/>
														</xsl:for-each>
													</span>
												</xsl:when>
												<xsl:otherwise>________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> компании </xsl:text>
											<span class="value">
												<xsl:apply-templates select="IntPD:Applicant" mode="organization"/>
											</span>
											<xsl:text> на срок до </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:InclusionPeriod">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:InclusionPeriod" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>_________</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании статьи 330 Федерального закона просим в течение месяца представить в ФТС России договор страхования риска ответственности правообладателя за причинение имущественного вреда, заключенный на срок включения объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>Согласно части 1 статьи 332 Федерального закона обращаем внимание на необходимость своевременного информирования ФТС России об изменении сведений, указанных в заявлении либо в прилагаемых к нему документах.</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="IntPD:Decision/IntPD:DecisionCode = '05'">
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br>
												<xsl:text>Уведомление</xsl:text>
											</br>
											<br>
												<xsl:text>о вынесенном решении о продлении срока включения объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности</xsl:text>
											</br>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>В соответствии с Таможенным кодексом Евразийского экономического союза, положениями статьи 329 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" ФТС России уведомляет о следующем.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании Вашего заявления от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:ApplicationInfo/cat_ru:PrDocumentDate">
													<span class="value">
														<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentDate" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_________</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber"/>
												</span>
											</xsl:if>
											<xsl:text> вынесено решение от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionDate">
													<span class="value">
														<xsl:apply-templates mode="date" select="IntPD:Decision/IntPD:DecisionDate"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text>  №  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionNumber">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:DecisionNumber"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> о продлении срока включения в таможенный реестр объектов интеллектуальной собственности следующего объекта интеллектуальной собственности </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo|IntPD:Decision/IntPD:NumReestr">
													<span class="value">
														<xsl:for-each select="IntPD:Decision/IntPD:NumReestr">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:for-each select="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo">
															<xsl:if test="IntPD:ObjectRegNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="IntPD:ObjectRegNumber"/>
															</xsl:if>
															<xsl:apply-templates select="." mode="IntellectualPropertyDecisionShort"/>
														</xsl:for-each>
													</span>
												</xsl:when>
												<xsl:otherwise>________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> компании </xsl:text>
											<span class="value">
												<xsl:apply-templates select="IntPD:Applicant" mode="organization"/>
											</span>
											<xsl:text> до </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:ProlongDate">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:ProlongDate" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>_________</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>Обращаем внимание на необходимость своевременного информирования ФТС России об изменении сведений, указанных в заявлении о включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности либо в прилагаемых к нему документах, а также о предпринимаемых мерах по защите прав на указанный объект интеллектуальной собственности по фактам, выявленным таможенными органами.</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="IntPD:Decision/IntPD:DecisionCode = '02'">
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br>
												<xsl:text>Уведомление</xsl:text>
											</br>
											<br>
												<xsl:text>о вынесенном решении о внесении изменений в таможенный реестр объектов интеллектуальной собственности</xsl:text>
											</br>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>В соответствии с Таможенным кодексом Евразийского экономического союза, положениями статей 331, 332 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" ФТС России уведомляет о следующем.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании Вашего заявления от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:ApplicationInfo/cat_ru:PrDocumentDate">
													<span class="value">
														<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentDate" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_________</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber"/>
												</span>
											</xsl:if>
											<xsl:text> вынесено решение от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionDate">
													<span class="value">
														<xsl:apply-templates mode="date" select="IntPD:Decision/IntPD:DecisionDate"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text>  №  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionNumber">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:DecisionNumber"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> о внесении изменений в таможенный реестр объектов интеллектуальной собственности в отношении объекта интеллектуальной собственности </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo|IntPD:Decision/IntPD:NumReestr">
													<span class="value">
														<xsl:for-each select="IntPD:Decision/IntPD:NumReestr">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:for-each select="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo">
															<xsl:if test="IntPD:ObjectRegNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="IntPD:ObjectRegNumber"/>
															</xsl:if>
															<xsl:apply-templates select="." mode="IntellectualPropertyDecisionShort"/>
														</xsl:for-each>
													</span>
												</xsl:when>
												<xsl:otherwise>________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> компании </xsl:text>
											<span class="value">
												<xsl:apply-templates select="IntPD:Applicant" mode="organization"/>
											</span>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>Обращаем внимание на необходимость своевременного информирования ФТС России об изменении сведений, указанных в заявлении о включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности либо в прилагаемых к нему документах, а также о предпринимаемых мерах по защите прав на указанный объект интеллектуальной собственности по фактам, выявленным таможенными органами.</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="IntPD:Decision/IntPD:DecisionCode = '06'">
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br>
												<xsl:text>Уведомление</xsl:text>
											</br>
											<br>
												<xsl:text> о вынесенном решении об отказе во внесении изменений в таможенный реестр объектов интеллектуальной собственности</xsl:text>
											</br>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>В соответствии с Таможенным кодексом Евразийского экономического союза, положениями статей 331, 332 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" ФТС России уведомляет о следующем.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании Вашего заявления от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:ApplicationInfo/cat_ru:PrDocumentDate">
													<span class="value">
														<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentDate" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_________</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber"/>
												</span>
											</xsl:if>
											<xsl:text> вынесено решение от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionDate">
													<span class="value">
														<xsl:apply-templates mode="date" select="IntPD:Decision/IntPD:DecisionDate"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text>  №  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionNumber">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:DecisionNumber"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> об отказе во внесении изменений в таможенный реестр объектов интеллектуальной собственности в отношении объекта интеллектуальной собственности </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo|IntPD:Decision/IntPD:NumReestr">
													<span class="value">
														<xsl:for-each select="IntPD:Decision/IntPD:NumReestr">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:for-each select="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo">
															<xsl:if test="IntPD:ObjectRegNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="IntPD:ObjectRegNumber"/>
															</xsl:if>
															<xsl:apply-templates select="." mode="IntellectualPropertyDecisionShort"/>
														</xsl:for-each>
													</span>
												</xsl:when>
												<xsl:otherwise>________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> компании </xsl:text>
											<span class="value">
												<xsl:apply-templates select="IntPD:Applicant" mode="organization"/>
											</span>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>Обращаем внимание на необходимость своевременного информирования ФТС России об изменении сведений, указанных в заявлении о включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности либо в прилагаемых к нему документах, а также о предпринимаемых мерах по защите прав на указанный объект интеллектуальной собственности по фактам, выявленным таможенными органами.</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="IntPD:Decision/IntPD:DecisionCode = '07'">
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br>
												<xsl:text>Уведомление</xsl:text>
											</br>
											<br>
												<xsl:text>о вынесенном решении об отказе во включении объекта интеллектуальной собственности в таможенный реестр объектов интеллектуальной собственности</xsl:text>
											</br>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>В соответствии с Таможенным кодексом Евразийского экономического союза, положениями статьи 331 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" ФТС России уведомляет о следующем.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании Вашего заявления от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:ApplicationInfo/cat_ru:PrDocumentDate">
													<span class="value">
														<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentDate" mode="date"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_________</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<span class="value">
													<xsl:apply-templates select="IntPD:ApplicationInfo/cat_ru:PrDocumentNumber"/>
												</span>
											</xsl:if>
											<xsl:text> вынесено решение от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionDate">
													<span class="value">
														<xsl:apply-templates mode="date" select="IntPD:Decision/IntPD:DecisionDate"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text>  №  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionNumber">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:DecisionNumber"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> об отказе во включении в таможенный реестр объектов интеллектуальной собственности объекта интеллектуальной собственности </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo|IntPD:Decision/IntPD:NumReestr">
													<span class="value">
														<xsl:for-each select="IntPD:Decision/IntPD:NumReestr">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:for-each select="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo">
															<xsl:if test="IntPD:ObjectRegNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="IntPD:ObjectRegNumber"/>
															</xsl:if>
															<xsl:apply-templates select="." mode="IntellectualPropertyDecisionShort"/>
														</xsl:for-each>
													</span>
												</xsl:when>
												<xsl:otherwise>________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> компании </xsl:text>
											<span class="value">
												<xsl:apply-templates select="IntPD:Applicant" mode="organization"/>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:text>(</xsl:text>
											<xsl:apply-templates select="IntPD:Decision/IntPD:Base"/>
											<xsl:text>).</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="descr">
											<xsl:text>(основание)</xsl:text>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="IntPD:Decision/IntPD:DecisionCode = '03'">
									<tr>
										<td align="center" style="font-weight:bold;">
											<br/>
											<br>
												<xsl:text>Уведомление</xsl:text>
											</br>
											<br>
												<xsl:text>о вынесенном решении об исключении объекта интеллектуальной собственности из таможенного реестра объектов интеллектуальной собственности</xsl:text>
											</br>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>В соответствии с Таможенным кодексом Евразийского экономического союза, положениями статьи 333 Федерального закона от 03.08.2018 № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" ФТС России уведомляет о следующем.</xsl:text>
										</td>
									</tr>
									<tr>
										<td style="text-indent: 5%; text-align:justify">
											<xsl:text>На основании </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:ApplicationInfo">
													<span class="value">
														<xsl:apply-templates select="IntPD:ApplicationInfo" mode="DocBase"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> вынесено решение от </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionDate">
													<span class="value">
														<xsl:apply-templates mode="date" select="IntPD:Decision/IntPD:DecisionDate"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text>  №  </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:DecisionNumber">
													<span class="value">
														<xsl:apply-templates select="IntPD:Decision/IntPD:DecisionNumber"/>
													</span>
												</xsl:when>
												<xsl:otherwise>_______</xsl:otherwise>
											</xsl:choose>
											<xsl:text> об исключении из таможенного реестра объектов интеллектуальной собственности объекта интеллектуальной собственности </xsl:text>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo|IntPD:Decision/IntPD:NumReestr">
													<span class="value">
														<xsl:for-each select="IntPD:Decision/IntPD:NumReestr">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
														<xsl:for-each select="IntPD:Decision/IntPD:IntellectualPropertyObjectsInfo">
															<xsl:if test="IntPD:ObjectRegNumber">
																<xsl:text> № </xsl:text>
																<xsl:apply-templates select="IntPD:ObjectRegNumber"/>
															</xsl:if>
															<xsl:apply-templates select="." mode="IntellectualPropertyDecisionShort"/>
														</xsl:for-each>
													</span>
												</xsl:when>
												<xsl:otherwise>________</xsl:otherwise>
											</xsl:choose>
											<xsl:text> компании </xsl:text>
											<span class="value">
												<xsl:apply-templates select="IntPD:Applicant" mode="organization"/>
											</span>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
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
												<td width="25%"/>
												<td width="5%"/>
												<td width="25%"/>
												<td width="5%"/>
												<td width="40%"/>
											</tr>
											<xsl:choose>
												<xsl:when test="IntPD:Decision/IntPD:CustomsAuthorizedPerson">
													<xsl:for-each select="IntPD:Decision/IntPD:CustomsAuthorizedPerson">
														<tr>
															<td class="value">
																<xsl:text> </xsl:text>
																<xsl:apply-templates select="IntPD:CustomsPersonPost"/>
																<xsl:apply-templates select="IntPD:CustomsPersonRank"/>
																<xsl:if test="IntPD:CustomsAuthority/cat_ru:OfficeName">
																	<xsl:text> (</xsl:text>
																</xsl:if>
																<xsl:apply-templates select="IntPD:CustomsAuthority/cat_ru:Code"/>
																<xsl:if test="IntPD:CustomsAuthority/cat_ru:OfficeName">
																	<xsl:text>)</xsl:text>
																</xsl:if>
															</td>
															<td/>
															<td class="value"/>
															<td/>
															<td align="center" class="value">
																<xsl:apply-templates select="IntPD:CustomsPerson"/>
															</td>
														</tr>
														<tr>
															<td class="descr">
																<xsl:text>(должностное лицо ФТС России)</xsl:text>
															</td>
															<td/>
															<td class="descr">
																<xsl:text>(подпись)</xsl:text>
															</td>
															<td/>
															<td class="descr">
																<xsl:text>(расшифровка подписи)</xsl:text>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td class="value"/>
														<td/>
														<td class="value"/>
														<td/>
														<td class="value"/>
													</tr>
													<tr>
														<td class="descr">
															<xsl:text>(должность (при наличии)</xsl:text>
														</td>
														<td/>
														<td class="descr">
															<xsl:text>(подпись, печать (при наличии)</xsl:text>
														</td>
														<td/>
														<td class="descr">
															<xsl:text>(Ф.И.О. (отчество - при наличии)</xsl:text>
														</td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
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
			<xsl:text>, </xsl:text>
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
		<xsl:apply-templates select="RUScat_ru:PersonId"/>
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
		<xsl:text> </xsl:text>
		<xsl:for-each select="IntPD:RightHolderLegal|IntPD:RightHolderForeignLegal">
			<br>
				<xsl:apply-templates mode="ForeignOrganization" select="."/>
			</br>
		</xsl:for-each>
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
	<xsl:template mode="ForeignOrganization" match="*">
		<xsl:apply-templates select="IntPD:FullNameRus"/>
		<xsl:if test="IntPD:FullNameForeign">/<xsl:apply-templates select="IntPD:FullNameForeign"/>
		</xsl:if>
		<xsl:if test="IntPD:ShortNameRus|IntPD:ShortNameForeign">(<xsl:apply-templates select="IntPD:ShortNameRus"/>
			<xsl:if test="IntPD:ShortNameForeign">/<xsl:apply-templates select="IntPD:ShortNameForeign"/>
			</xsl:if>)</xsl:if>
		<xsl:if test="IntPD:FullAddressRus|IntPD:FullAddressForeign">,<xsl:apply-templates select="IntPD:FullAddressRus"/>
			<xsl:if test="IntPD:FullAddressForeign">/<xsl:apply-templates select="IntPD:FullAddressForeign"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="IntPD:DocRegistration">,<xsl:apply-templates select="IntPD:DocRegistration"/>
		</xsl:if>
		<xsl:if test="IntPD:RegistrationDocumentNumber"> №<xsl:apply-templates select="IntPD:RegistrationDocumentNumber"/>
		</xsl:if>
		<xsl:if test="IntPD:RegistrationDate">
			<xsl:apply-templates mode="date" select="IntPD:RegistrationDate"/>
		</xsl:if>
		<xsl:if test="IntPD:RegistrationPlace">,<xsl:apply-templates select="IntPD:RegistrationPlace"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="IntellectualPropertyDecisionShort" match="*">
		<xsl:apply-templates select="IntPD:Copyright/IntPD:ProductName"/>
		<xsl:if test="IntPD:Copyright/IntPD:ObjectDescription">,<xsl:apply-templates select="IntPD:Copyright/IntPD:ObjectDescription"/>
		</xsl:if>
		<xsl:apply-templates select="IntPD:Mark/IntPD:BrandMarkName"/>
		<xsl:if test="IntPD:Mark/IntPD:BrandMarkDescription">,<xsl:apply-templates select="IntPD:Mark/IntPD:BrandMarkDescription"/>
		</xsl:if>
		<xsl:apply-templates select="IntPD:OriginPlace/IntPD:OriginName"/>
	</xsl:template>
	<xsl:template mode="IntellectualPropertyDecision" match="*">
		<xsl:apply-templates select="IntPD:Copyright/IntPD:ProductForm"/>
		<xsl:if test="IntPD:Copyright/IntPD:ProductType">,<xsl:apply-templates select="IntPD:Copyright/IntPD:ProductType"/>
		</xsl:if>
		<xsl:if test="IntPD:Copyright/IntPD:ProductName">,<xsl:apply-templates select="IntPD:Copyright/IntPD:ProductName"/>
		</xsl:if>
		<xsl:if test="IntPD:Copyright/IntPD:ObjectDescription">,<xsl:apply-templates select="IntPD:Copyright/IntPD:ObjectDescription"/>
		</xsl:if>
		<xsl:if test="IntPD:Copyright/IntPD:InfoDocument">, документы, подтверждающие наличие прав:<xsl:for-each select="IntPD:Copyright/IntPD:InfoDocument">
				<xsl:apply-templates mode="InfoDocument" select="."/>
				<xsl:if test="position()!=last()">,</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPD:Copyright/IntPD:InfoDocRightsTransmission">, документы, подтверждающие передачу прав:<xsl:for-each select="IntPD:Copyright/IntPD:InfoDocRightsTransmission">
				<xsl:apply-templates mode="InfoDocument" select="."/>
				<xsl:if test="position()!=last()">,</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPD:Copyright/IntPD:Goods">, товары:<xsl:for-each select="IntPD:Copyright/IntPD:Goods">
				<xsl:apply-templates mode="Goods" select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:apply-templates select="IntPD:Mark/IntPD:BrandMarkName"/>
		<xsl:apply-templates select="IntPD:Mark/IntPD:BrandMarkDescription"/>
		<xsl:if test="IntPD:Mark/IntPD:LapseOfRightDocumentsDescription">,<xsl:apply-templates select="IntPD:Mark/IntPD:LapseOfRightDocumentsDescription"/>
		</xsl:if>
		<xsl:if test="IntPD:Mark/IntPD:Goods">, товары:<xsl:for-each select="IntPD:Mark/IntPD:Goods">
				<xsl:apply-templates mode="Goods" select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPD:Mark/IntPD:DocumentInfo">, документы, подтверждающие регистрацию товароного знака:<xsl:for-each select="IntPD:Mark/IntPD:DocumentInfo">
				<xsl:apply-templates mode="InfoDocument" select="."/>
				<xsl:if test="position()!=last()">,</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPD:Mark/IntPD:TrademarkWithoutContract">,<xsl:apply-templates select="IntPD:Mark/IntPD:TrademarkWithoutContract"/>
		</xsl:if>
		<xsl:apply-templates select="IntPD:OriginPlace/IntPD:OriginName"/>
		<xsl:if test="IntPD:OriginPlace/IntPD:LapseOfRightDocumentsDescription">,<xsl:apply-templates select="IntPD:OriginPlace/IntPD:LapseOfRightDocumentsDescription"/>
		</xsl:if>
		<xsl:if test="IntPD:OriginPlace/IntPD:Goods">, товары:<xsl:for-each select="IntPD:OriginPlace/IntPD:Goods">
				<xsl:apply-templates mode="Goods" select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="IntPD:OriginPlace/IntPD:InfoReg">, документы, подтверждающие регистрацию и предоставление права пользования наименованием места происхождения:<xsl:for-each select="IntPD:OriginPlace/IntPD:InfoReg">
				<xsl:apply-templates mode="InfoDocument" select="."/>
				<xsl:if test="position()!=last()">,</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="Goods" match="*">
		<xsl:apply-templates select="IntPD:ObjType"/>
		<xsl:for-each select="IntPD:MeasuredGoods">
			<xsl:apply-templates select="IntPD:GoodsName"/>
			<xsl:if test="IntPD:GoodsClass">
				<xsl:if test="IntPD:GoodsName">,</xsl:if> класс по МКТУ:<xsl:apply-templates select="IntPD:GoodsClass"/>
			</xsl:if>
			<xsl:if test="IntPD:BogusProductCodes">
				<xsl:if test="IntPD:GoodsName|IntPD:GoodsClass">,</xsl:if> код ТН ВЭД ЕАЭС: <xsl:apply-templates select="IntPD:BogusProductCodes"/>
			</xsl:if>
			<xsl:if test="position()!=last()">,</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="InfoDocument" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="local-name()='PrDocumentDate'"> от <xsl:apply-templates select="." mode="date"/>
				</xsl:when>
				<xsl:when test="local-name()='DocumentRegDate'"> от <xsl:apply-templates select="." mode="date"/>
				</xsl:when>
				<xsl:when test="local-name()='ComplationAuthorityDate'"> до <xsl:apply-templates select="." mode="date"/>
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
	<!-- Шаблон для типа cat_ru:ITNKZType -->
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
</xsl:stylesheet>
