<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Минфина России № 111н от 18 июля 2022 года "Об установлении Порядка принятия и выдачи предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию, а также принятия решения о прекращении действия предварительного решения"
Приложение №3 - Уведомление об отказе в рассмотрении заявления о принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию (cvua:RejectConsiderPrelimDecisionInfo)
Приложение №4 - Уведомление об отказе в принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию (cvua:RefusalPreliminaryDecisionInfo)
Приложение №5 - Предварительное решение по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию (cvua:PreliminaryDecisionInfo)
Приложение №6 - Решение о прекращении действия предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию (cvua:CancelPreliminaryDecisionInfo) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cvua="urn:customs.ru:Information:ExchangeDocuments:CustomsValueUsagePrelimDecision:5.26.0">
	<!-- Шаблон для типа CustomsValueUsagePrelimDecisionType -->
	<xsl:template match="cvua:CustomsValueUsagePrelimDecision">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{/*white-space: normal;*/}

					div.page
					{margin: 10px auto;
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
					font-size: 10pt;
					/*font-style: italic;*/}

					.annot
					{font-family: Arial;
					font-size: 10pt;}

					.descr
					{font-family: Arial;
					font-size: 7pt;
					text-align: center}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 10pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

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
                </style>
			</head>
			<body>
				<!-- Уведомление об отказе в рассмотрении заявления о принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию -->
				<xsl:if test="cvua:RejectConsiderPrelimDecisionInfo">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<xsl:text>Уведомление</xsl:text>
										<br/>
										<xsl:text>об отказе в рассмотрении заявления о принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr align="left">
									<td class="bordered annot" width="50%">
										<xsl:text>1. Уполномоченный таможенный орган, принявший решение об отказе в рассмотрении заявления о принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию (далее - Заявление)</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:Customs"/>
										</i>
									</td>
									<td class="bordered annot" width="50%">
										<xsl:text>2. Сведения о заявителе</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="cvua:OrganizationInfo/cat_ru:OrganizationName"/>
													<xsl:if test="cvua:OrganizationInfo/cat_ru:ShortName">
														<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:value-of select="cvua:OrganizationInfo/cat_ru:ShortName"/>
													</xsl:if>
													<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
														<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName or cvua:OrganizationInfo/cat_ru:ShortName">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:text>ИНН - </xsl:text>
														<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(полное наименование организации либо фамилия, имя, отчество (при наличии) заявителя (для физического лица), идентификационный номер налогоплательщика)'"/>
												<xsl:with-param name="width" select="'99%'"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>3. Дата уведомления об отказе в рассмотрении Заявления</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:RejectConsiderPrelimDecisionInfo/cvua:NotifDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" width="50%">
										<xsl:text>4. Номер и дата Заявления</xsl:text>
										<br/><br/>
										<i>
											<xsl:if test="cvua:RejectConsiderPrelimDecisionInfo/cvua:ApplicationNumber/cvua:AppSerialNumber">
												<xsl:text>№ </xsl:text>
												<xsl:apply-templates select="cvua:RejectConsiderPrelimDecisionInfo/cvua:ApplicationNumber/cvua:AppSerialNumber"/>
											</xsl:if>
											<xsl:if test="cvua:RejectConsiderPrelimDecisionInfo/cvua:ApplicationNumber/cvua:AppDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cvua:RejectConsiderPrelimDecisionInfo/cvua:ApplicationNumber/cvua:AppDate"/>
												</xsl:call-template>
											</xsl:if>
										</i>
									</td>
									<td class="bordered annot" width="50%">
										<xsl:text>5. Регистрационный номер и дата регистрации Заявления</xsl:text>
										<br/><br/>
										<i>
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="cvua:RejectConsiderPrelimDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dategtd" select="cvua:RejectConsiderPrelimDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="cvua:RejectConsiderPrelimDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:SerialNumber"/>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:RejectConsiderPrelimDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>6. Краткое наименование и описание товаров, указанных в Заявлении, в том числе информация о товарном знаке, марке, артикуле и других характеристиках товаров</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsShortName"/>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsMark">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsMark"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsModel">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsModel"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsMarking">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsMarking"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsStandard">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsStandard"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsSort">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsSort"/>
											</xsl:if>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>7. Объект интеллектуальной собственности</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:TradeMark"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>8. Основание и причины принятия решения об отказе в рассмотрении Заявления</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:RejectConsiderPrelimDecisionInfo/cvua:RejectConsiderReason"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>9. Должностное лицо уполномоченного таможенного органа, принявшее решение об отказе в рассмотрении Заявления</xsl:text>
										<br/><br/>
										<table>
											<tbody>
												<tr valign="bottom" align="center">
													<td width="2%"/>
													<td class="value" width="28%">
														<i>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonPost"/>
														</i>
													</td>
													<td width="5%"/>
													<td class="value" width="15%"/>
													<td width="5%"/>
													<td class="value" width="43%">
														<i>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonSurname"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonName"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonMiddleName"/>
														</i>
													</td>
													<td width="2%"/>
												</tr>
												<tr align="center">
													<td width="2%"/>
													<td class="descr" width="28%">Должность</td>
													<td width="5%"/>
													<td class="descr" width="15%">Подпись</td>
													<td width="5%"/>
													<td class="descr" width="43%">Фамилия, имя, отчество (при наличии)</td>
													<td width="2%"/>
												</tr>
												<tr align="center">
													<td width="2%"/>
													<td width="28%"><br/></td>
													<td width="5%"/>
													<td width="15%"><br/></td>
													<td width="5%"/>
													<td width="43%"><br/></td>
													<td width="2%"/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- Уведомление об отказе в принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию -->
				<xsl:if test="cvua:RefusalPreliminaryDecisionInfo">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<xsl:text>Уведомление</xsl:text>
										<br/>
										<xsl:text>об отказе в принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr align="left">
									<td class="bordered annot" width="50%">
										<xsl:text>1. Уполномоченный таможенный орган, принявший решение об отказе в принятии предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию (далее - предварительное решение)</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:Customs"/>
										</i>
									</td>
									<td class="bordered annot" width="50%">
										<xsl:text>2. Сведения о заявителе</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="cvua:OrganizationInfo/cat_ru:OrganizationName"/>
													<xsl:if test="cvua:OrganizationInfo/cat_ru:ShortName">
														<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:value-of select="cvua:OrganizationInfo/cat_ru:ShortName"/>
													</xsl:if>
													<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
														<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName or cvua:OrganizationInfo/cat_ru:ShortName">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:text>ИНН - </xsl:text>
														<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(полное наименование организации либо фамилия, имя, отчество (при наличии) заявителя (для физического лица), идентификационный номер налогоплательщика)'"/>
												<xsl:with-param name="width" select="'99%'"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>3. Дата уведомления об отказе в принятии предварительного решения</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:RefusalPreliminaryDecisionInfo/cvua:RefusalDecisionDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" width="50%">
										<xsl:text>4. Номер и дата Заявления</xsl:text>
										<br/><br/>
										<i>
											<xsl:if test="cvua:RefusalPreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:AppSerialNumber">
												<xsl:text>№ </xsl:text>
												<xsl:apply-templates select="cvua:RefusalPreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:AppSerialNumber"/>
											</xsl:if>
											<xsl:if test="cvua:RefusalPreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:AppDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cvua:RefusalPreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:AppDate"/>
												</xsl:call-template>
											</xsl:if>
										</i>
									</td>
									<td class="bordered annot" width="50%">
										<xsl:text>5. Регистрационный номер и дата регистрации Заявления</xsl:text>
										<br/><br/>
										<i>
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="cvua:RefusalPreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dategtd" select="cvua:RefusalPreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="cvua:RefusalPreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:SerialNumber"/>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:RefusalPreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>6. Краткое наименование и описание товаров, указанных в Заявлении, в том числе информация о товарном знаке, марке, артикуле и других характеристиках товаров</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsShortName"/>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsMark">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsMark"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsModel">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsModel"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsMarking">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsMarking"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsStandard">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsStandard"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsSort">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsSort"/>
											</xsl:if>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>7. Объект интеллектуальной собственности</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:TradeMark"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>8. Основание и причины принятия решения об отказе в принятии предварительного решения</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:RefusalPreliminaryDecisionInfo/cvua:RefusalDecisionReason"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>9. Должностное лицо уполномоченного таможенного органа, принявшее решение об отказе в принятии предварительного решения</xsl:text>
										<br/><br/>
										<table>
											<tbody>
												<tr valign="bottom" align="center">
													<td width="2%"/>
													<td class="value" width="28%">
														<i>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonPost"/>
														</i>
													</td>
													<td width="5%"/>
													<td class="value" width="15%"/>
													<td width="5%"/>
													<td class="value" width="43%">
														<i>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonSurname"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonName"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonMiddleName"/>
														</i>
													</td>
													<td width="2%"/>
												</tr>
												<tr align="center">
													<td width="2%"/>
													<td class="descr" width="28%">Должность</td>
													<td width="5%"/>
													<td class="descr" width="15%">Подпись</td>
													<td width="5%"/>
													<td class="descr" width="43%">Фамилия, имя, отчество (при наличии)</td>
													<td width="2%"/>
												</tr>
												<tr align="center">
													<td width="2%"/>
													<td width="28%"><br/></td>
													<td width="5%"/>
													<td width="15%"><br/></td>
													<td width="5%"/>
													<td width="43%"><br/></td>
													<td width="2%"/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- Предварительное решение по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию -->
				<xsl:if test="cvua:PreliminaryDecisionInfo">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<xsl:text>Предварительное решение</xsl:text>
										<br/>
										<xsl:text>по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>1. Регистрационный номер предварительного решения</xsl:text>
										<br/><br/>
										<i>
											<xsl:value-of select="cvua:PreliminaryDecisionInfo/cvua:DecisionRegNumber/cvua:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dategtd" select="cvua:PreliminaryDecisionInfo/cvua:DecisionRegNumber/cvua:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="cvua:PreliminaryDecisionInfo/cvua:DecisionRegNumber/cvua:SerialNumber"/>
											<xsl:if test="cvua:PreliminaryDecisionInfo/cvua:DecisionRegNumber/cvua:AddNumber">
												<xsl:text>/</xsl:text>
												<xsl:value-of select="cvua:PreliminaryDecisionInfo/cvua:DecisionRegNumber/cvua:AddNumber"/>
											</xsl:if>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>2. Номер и дата заявления о принятии предварительного решения (далее - Заявление)</xsl:text>
										<br/><br/>
										<i>
											<xsl:if test="cvua:PreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:AppSerialNumber">
												<xsl:text>№ </xsl:text>
												<xsl:apply-templates select="cvua:PreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:AppSerialNumber"/>
											</xsl:if>
											<xsl:if test="cvua:PreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:AppDate">
												<xsl:text> от </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="cvua:PreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:AppDate"/>
												</xsl:call-template>
											</xsl:if>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>3. Регистрационный номер и дата регистрации Заявления в уполномоченном таможенном органе</xsl:text>
										<br/><br/>
										<i>
											<xsl:text>№ </xsl:text>
											<xsl:value-of select="cvua:PreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dategtd" select="cvua:PreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="cvua:PreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:SerialNumber"/>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:PreliminaryDecisionInfo/cvua:ApplicationNumber/cvua:ApplicationRegNumber/cat_ru:RegistrationDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" width="50%">
										<xsl:text>4. Наименование уполномоченного таможенного органа, принявшего предварительное решение</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:Customs"/>
										</i>
									</td>
									<td class="bordered annot" width="50%">
										<xsl:text>5. Дата окончания срока действия предварительного решения</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:PreliminaryDecisionInfo/cvua:ExpirationDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" width="50%">
										<xsl:text>6. Сведения о заявителе</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="cvua:OrganizationInfo/cat_ru:OrganizationName"/>
													<xsl:if test="cvua:OrganizationInfo/cat_ru:ShortName">
														<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:value-of select="cvua:OrganizationInfo/cat_ru:ShortName"/>
													</xsl:if>
													<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN or cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
														<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName or cvua:OrganizationInfo/cat_ru:ShortName">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
															<xsl:text>ИНН - </xsl:text>
															<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
														</xsl:if>
														<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN and cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
															<xsl:text>ОГРН/ОГРНИП - </xsl:text>
															<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
														</xsl:if>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(полное наименование организации либо фамилия, имя, отчество (при наличии) заявителя (для физического лица), идентификационный номер налогоплательщика, основной государственный регистрационный номер индивидуального предпринимателя (для физического лица))'"/>
												<xsl:with-param name="width" select="'99%'"/>
											</xsl:call-template>
										</i>
									</td>
									<td class="bordered annot" width="50%">
										<xsl:text>7. Номер (при наличии) и дата внешнеэкономического договора купли-продажи (возмездного договора), а также номера (при наличии) и даты действующих приложений и изменений к нему</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:PreliminaryDecisionInfo/cvua:ForeignPurchaseAgreementInfo" mode="doc"/>
											<xsl:if test="cvua:PreliminaryDecisionInfo/cvua:ForeignPurchaseAttachments">
												<br/>
												<xsl:for-each select="cvua:PreliminaryDecisionInfo/cvua:ForeignPurchaseAttachments">
													<br/>
													<xsl:apply-templates select="." mode="doc"/>
												</xsl:for-each>
											</xsl:if>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>8. Номер (при наличии) и дата Лицензионного договора, а также номера (при наличии) и даты действующих приложений и изменений к нему</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:PreliminaryDecisionInfo/cvua:LicenseAgreementInfo" mode="doc"/>
											<xsl:if test="cvua:PreliminaryDecisionInfo/cvua:LicenseAttachments">
												<br/>
												<xsl:for-each select="cvua:PreliminaryDecisionInfo/cvua:LicenseAttachments">
													<br/>
													<xsl:apply-templates select="." mode="doc"/>
												</xsl:for-each>
											</xsl:if>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>9. Краткое наименование и описание товаров, в том числе информация о товарном знаке, марке, артикуле и других характеристиках товаров</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsShortName"/>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsMark">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsMark"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsModel">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsModel"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsMarking">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsMarking"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsStandard">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsStandard"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsSort">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsSort"/>
											</xsl:if>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>10. Объект интеллектуальной собственности</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:TradeMark"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>11. Метод определения таможенной стоимости товара</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:PreliminaryDecisionInfo/cvua:CustomsCostMethod"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>12. Обоснование принятого предварительного решения</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:PreliminaryDecisionInfo/cvua:DecisionReason"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>13. Перечень документов и (или) сведений, в том числе письменных пояснений, представленных заявителем</xsl:text>
										<br/><br/>
										<i>
											<xsl:for-each select="cvua:PreliminaryDecisionInfo/cvua:AttachedDocuments">
												<xsl:if test="position()!=1"><br/></xsl:if>
												<xsl:apply-templates select="." mode="doc"/>
												<xsl:if test="cvua:DocCode">
													<xsl:text> (код вида док-та - </xsl:text>
													<xsl:apply-templates select="cvua:DocCode"/>
													<xsl:text>)</xsl:text>
												</xsl:if>
											</xsl:for-each>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>14. Для служебных отметок</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:Notes"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>15. Должностное лицо уполномоченного таможенного органа, принявшее предварительное решение</xsl:text>
										<br/><br/>
										<table>
											<tbody>
												<tr valign="bottom" align="center">
													<td width="2%"/>
													<td class="value" width="28%">
														<i>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonPost"/>
														</i>
													</td>
													<td width="2%" style="border-right: solid 1px black;"/>
													<td width="2%"/>
													<td class="value" width="17%"/>
													<td width="2%" style="border-right: solid 1px black;"/>
													<td width="2%"/>
													<td class="value" width="43%">
														<i>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonSurname"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonName"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonMiddleName"/>
														</i>
													</td>
													<td width="2%"/>
												</tr>
												<tr align="center">
													<td width="2%"/>
													<td class="descr" width="28%">Должность</td>
													<td width="2%" style="border-right: solid 1px black;"/>
													<td width="2%"/>
													<td class="descr" width="17%">Подпись</td>
													<td width="2%" style="border-right: solid 1px black;"/>
													<td width="2%"/>
													<td class="descr" width="43%">Фамилия, имя, отчество (при наличии)</td>
													<td width="2%"/>
												</tr>
												<tr align="center">
													<td width="2%"/>
													<td width="28%"><br/></td>
													<td width="2%" style="border-right: solid 1px black;"/>
													<td width="2%"/>
													<td width="17%"><br/></td>
													<td width="2%" style="border-right: solid 1px black;"/>
													<td width="2%"/>
													<td width="43%"><br/></td>
													<td width="2%"/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- Решение о прекращении действия предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию -->
				<xsl:if test="cvua:CancelPreliminaryDecisionInfo">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<xsl:text>Решение</xsl:text>
										<br/>
										<xsl:text>о прекращении действия предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<table>
							<tbody>
								<tr align="left">
									<td class="bordered annot" width="50%">
										<xsl:text>1. Уполномоченный таможенный орган, принявший решение о прекращении действия предварительного решения по вопросам применения методов определения таможенной стоимости товаров, ввозимых в Российскую Федерацию (далее - предварительное решение)</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:Customs"/>
										</i>
									</td>
									<td class="bordered annot" width="50%">
										<xsl:text>2. Сведения о заявителе</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="cvua:OrganizationInfo/cat_ru:OrganizationName"/>
													<xsl:if test="cvua:OrganizationInfo/cat_ru:ShortName">
														<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:value-of select="cvua:OrganizationInfo/cat_ru:ShortName"/>
													</xsl:if>
													<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN or cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
														<xsl:if test="cvua:OrganizationInfo/cat_ru:OrganizationName or cvua:OrganizationInfo/cat_ru:ShortName">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN">
															<xsl:text>ИНН - </xsl:text>
															<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
														</xsl:if>
														<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:INN and cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
															<xsl:text>, </xsl:text>
														</xsl:if>
														<xsl:if test="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
															<xsl:text>ОГРН/ОГРНИП - </xsl:text>
															<xsl:value-of select="cvua:OrganizationInfo/cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
														</xsl:if>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(полное наименование организации либо фамилия, имя, отчество (при наличии) заявителя (для физического лица), идентификационный номер налогоплательщика, основной государственный регистрационный номер индивидуального предпринимателя (для физического лица))'"/>
												<xsl:with-param name="width" select="'99%'"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>3. Дата решения о прекращении действия предварительного решения</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:CancelPreliminaryDecisionInfo/cvua:CancellationDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>4. Регистрационный номер предварительного решения, действие которого прекращается</xsl:text>
										<br/><br/>
										<i>
											<xsl:value-of select="cvua:CancelPreliminaryDecisionInfo/cvua:CancelDecisionRegNumber/cvua:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="russian_date_gtd">
												<xsl:with-param name="dategtd" select="cvua:CancelPreliminaryDecisionInfo/cvua:CancelDecisionRegNumber/cvua:RegistrationDate"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="cvua:CancelPreliminaryDecisionInfo/cvua:CancelDecisionRegNumber/cvua:SerialNumber"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="cvua:CancelPreliminaryDecisionInfo/cvua:CancelDecisionRegNumber/cvua:AddNumber"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>5. Краткое наименование и описание товаров, указанных в предварительном решении, в том числе информация о товарном знаке, марке, артикуле и других характеристиках товаров</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsShortName"/>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsMark">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsMark"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsModel">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsModel"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsMarking">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsMarking"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsStandard">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsStandard"/>
											</xsl:if>
											<xsl:if test="cvua:GoodInfo/cvua:GoodsSort">
												<xsl:text>; </xsl:text>
												<xsl:apply-templates select="cvua:GoodInfo/cvua:GoodsSort"/>
											</xsl:if>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>6. Объект интеллектуальной собственности</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:GoodInfo/cvua:TradeMark"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>7. Основание и причины принятия решения о прекращении действия предварительного решения</xsl:text>
										<br/><br/>
										<i>
											<xsl:apply-templates select="cvua:CancelPreliminaryDecisionInfo/cvua:CancellationReason"/>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>8. Дата вступления в силу решения о прекращении действия предварительного решения</xsl:text>
										<br/><br/>
										<i>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cvua:CancelPreliminaryDecisionInfo/cvua:StartCancelDate"/>
											</xsl:call-template>
										</i>
									</td>
								</tr>
								<tr align="left">
									<td class="bordered annot" colspan="2">
										<xsl:text>9. Должностное лицо уполномоченного таможенного органа, принявшее решение о прекращении действия предварительного решения</xsl:text>
										<br/><br/>
										<table>
											<tbody>
												<tr valign="bottom" align="center">
													<td width="2%"/>
													<td class="value" width="28%">
														<i>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonPost"/>
														</i>
													</td>
													<td width="5%"/>
													<td class="value" width="15%"/>
													<td width="5%"/>
													<td class="value" width="43%">
														<i>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonSurname"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonName"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="cvua:CustomsPersonInfo/cat_ru:PersonMiddleName"/>
														</i>
													</td>
													<td width="2%"/>
												</tr>
												<tr align="center">
													<td width="2%"/>
													<td class="descr" width="28%">Должность</td>
													<td width="5%"/>
													<td class="descr" width="15%">Подпись</td>
													<td width="5%"/>
													<td class="descr" width="43%">Фамилия, имя, отчество (при наличии)</td>
													<td width="2%"/>
												</tr>
												<tr align="center">
													<td width="2%"/>
													<td width="28%"><br/></td>
													<td width="5%"/>
													<td width="15%"><br/></td>
													<td width="5%"/>
													<td width="43%"><br/></td>
													<td width="2%"/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="*" mode="identity_card">
		<xsl:text> документ: </xsl:text>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text>; </xsl:text>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="cvua:OrganizationInfo/RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:choose>
				<xsl:when test="RUScat_ru:AddressKindCode = 1">адрес регистрации: </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode = 2">фактический адрес: </xsl:when>
				<xsl:when test="RUScat_ru:AddressKindCode = 3">почтовый адрес: </xsl:when>
				<xsl:otherwise>
					<xsl:text>(код вида адреса: </xsl:text>
					<xsl:apply-templates select="RUScat_ru:AddressKindCode"/>
					<xsl:text>) </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:apply-templates select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="not(RUScat_ru:AddressText)">
			<xsl:if test="RUScat_ru:PostalCode">
				<xsl:apply-templates select="RUScat_ru:PostalCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:CountryCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:CounryName">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:CounryName"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Region">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Region"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:District">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:District"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Town">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Town"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:City">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:City"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:StreetHouse">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:StreetHouse"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:House">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:House"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:Room">
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="RUScat_ru:Room"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKTMO">
				<xsl:text>, ОКТМО </xsl:text>
				<xsl:apply-templates select="RUScat_ru:OKTMO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:OKATO">
				<xsl:text>, ОKАTO </xsl:text>
				<xsl:apply-templates select="RUScat_ru:OKATO"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:KLADR">
				<xsl:text>, КЛАДР </xsl:text>
				<xsl:apply-templates select="RUScat_ru:KLADR"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:AOGUID">
				<xsl:text>, Глобальный идентификатор адресного объекта по ФИАС </xsl:text>
				<xsl:apply-templates select="RUScat_ru:AOGUID"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode">
				<xsl:text>, Код единицы административно-территориального деления </xsl:text>
				<xsl:apply-templates select="RUScat_ru:TerritoryCode"/>
			</xsl:if>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<xsl:text>, а/я </xsl:text>
				<xsl:apply-templates select="RUScat_ru:PostOfficeBoxId"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>

	<xsl:template match="cvua:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
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
					<xsl:if test="$comma != 0 and $list != 0 and $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="//*[local-name()='CustomsValueUsagePrelimDecision']//*" priority="-1">
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

	<xsl:template name="russian_date_gtd">
		<xsl:param name="dategtd"/>
		<xsl:choose>
			<xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
				<xsl:value-of select="substring($dategtd,9,2)"/>
				<xsl:value-of select="substring($dategtd,6,2)"/>
				<xsl:value-of select="substring($dategtd,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dategtd"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dategtd" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
</xsl:stylesheet>
