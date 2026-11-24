<?xml version="1.0" encoding="utf-8"?>
<!--Решение Коллегии Евразийской экономической комиссии от 06.12.2022 № 189 «О внесении изменений в Решение Коллегии Евразийской экономической комиссии от 16 октября 2018 г. № 158».-->
<!--Решение Коллегии Евразийской экономической комиссии от 14.09.2023 № 137 «О внесении изменений в Решение Коллегии Евразийской экономической комиссии от 28 августа 2018 г. № 142».-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:ecrc="urn:customs.ru:Information:CustomsDocuments:ExpressCargoReqCorrect:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExpressCargoReqCorrectType -->
	<xsl:template match="ecrc:ExpressCargoReqCorrect">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div
					{white-space: normal;}

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
					font-size: 11pt;
					font-style: italic;}

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

					.bordered
					{border-collapse: collapse;
					font-family: Arial;}

					td.bordered
					{border: solid 1px windowtext;}

					td.HeaderMain
					{vertical-align:top;
					text-align: center;}

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
					text-align: center;
					vertical-align: top;}
                </style>
			</head>
			<body>
				<!--ДТЭГ Требование-->
				<xsl:if test="ecrc:CorrectDocType='1' and ecrc:DocKind='1'">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="3">
											<b>ТРЕБОВАНИЕ<br/>о внесении изменений (дополнений) в сведения, заявленные<br/>в декларации на товары для экспресс-грузов, до выпуска товаров</b>
										</font>
									</td>
								</tr>
								<tr/>
								<tr>
									<td align="center" class="title">
										<font size="3">
											от <xsl:apply-templates select="ecrc:DecisionDateTime" mode="DateStr"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tr align="center">
								<td class="bordered" style="width:40%">
									<xsl:apply-templates select="ecrc:Customs/cat_ru:Code"/>
								</td>
								<td style="width:20%"/>
								<td class="bordered" style="width:40%">
									<xsl:apply-templates select="ecrc:BrokerName"/>
								</td>
							</tr>
						</table>
						<br/>
						<font size="2">В соответствии с пунктом 2 статьи 112 Таможенного кодекса Евразийского экономического союза уведомляем, что в ходе проведения таможенного контроля в отношении товаров и сведений, заявленных в декларации на товары для экспресс-грузов c регистрационным номером
							<xsl:choose>
								<xsl:when test="ecrc:ApplicationRegNumber">
									<u>
										<xsl:value-of select="ecrc:ApplicationRegNumber/cat_ru:CustomsCode"/>/<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,9,2)"/>
										<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,6,2)"/>
										<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="ecrc:ApplicationRegNumber/cat_ru:GTDNumber"/>/<xsl:value-of select="ecrc:ApplicationRegNumber/RUScat_ru:AddNumber"/>
									</u>
								</xsl:when>
								<xsl:otherwise>			
									 <u>                  </u> 			
								</xsl:otherwise>
							</xsl:choose>, выявлено следующее:<br/>
							<br/>
						</font>
						<font size="2">
							<table class="inlinetable" style="width: 100%;">
								<tbody>
									<tr align="left">
										<td class="value" width="100%">
											<xsl:for-each select="ecrc:IdentifiedViolations">
												<xsl:value-of select="."/>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
						</font>
						<br/>
						<br/>
						<font size="2">
							До 
							<xsl:choose>
								<xsl:when test="ecrc:LimitDateTime">
									<xsl:apply-templates select="ecrc:LimitDateTime" mode="DateStr"/>
								</xsl:when>
								<xsl:otherwise>
									"_____" __________________ 20____ г.
								</xsl:otherwise>
							</xsl:choose>
							 в таможенный орган необходимо представить корректировку декларации на товары для экспресс-грузов, заполненную в соответствии с Порядком заполнения корректировки декларации на товары для экспресс-грузов, утвержденным Решением Коллегии Евразийской экономической комиссии от 28 августа 2018 г. № 142, в связи с необходимостью внесения изменений (дополнений) в следующие сведения, заявленные в ДТЭГ:
						</font><br/><br/>
						<xsl:if test="ecrc:Consignment">
							<div style="width:100%; min-width:{$w}mm;">
								<table>
									<tbody>
										<tr class="title">
											<td class="HeaderMain bordered">
												№ п/п
											</td>
											<td class="HeaderMain bordered">
												Порядковый<br/>номер товара
											</td>
											<td class="HeaderMain bordered">
												Номер графы/<br/>колонки графы/<br/>строки
											</td>
											<td class="HeaderMain bordered">
												Сведения,<br/>заявленные в ДТЭГ
											</td>
											<td class="HeaderMain bordered">
												Измененные<br/>(дополненные)<br/>сведения
											</td>
										</tr>
										<xsl:apply-templates select="ecrc:Consignment/ecrc:ChangeDetails">
											<xsl:with-param name="wdth" select="$w"/>
										</xsl:apply-templates>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<br/>
						<table>
							<tr>
								<td class="value graphMain" style="width:40%" align="center">
									<xsl:if test="ecrc:CustomsPerson/cat_ru:PersonName">
										<xsl:value-of select="ecrc:CustomsPerson/cat_ru:PersonName"/>
									</xsl:if>
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:30%">								
								</td>
								<td style="width:5%"/>
								<td class="bordered" style="width:20%" rowspan="2" align="center">
									<xsl:if test="ecrc:CustomsPerson/cat_ru:LNP">
										<xsl:value-of select="ecrc:CustomsPerson/cat_ru:LNP"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:40%" class="HeaderMain">
									<font size="1">
										(Ф. И. О. должностного лица таможенного органа)<!--*-->
									</font>
								</td>
								<td style="width:5%"/>
								<td style="width:30%" class="HeaderMain">
									<font size="1">
										(подпись)<!--*-->
									</font>
								</td>
								<td style="width:5%"/>
							</tr>
						</table>
						<br/>
						<font size="3">
							<b>Требование получено:</b>
						</font>
						<br/>
						<br/>
						<table>
							<tr>
								<td class="value graphMain" style="width:40%" align="center">
									<xsl:if test="ecrc:BrokerPerson">
										<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:if test="ecrc:BrokerPerson/cat_ru:PersonMiddleName">
											<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:if>
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:20%">								
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:30%" align="center">
									<xsl:if test="ecrc:BrokerPerson/ecrc:IssueDate">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ecrc:BrokerPerson/ecrc:IssueDate"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:40%" class="HeaderMain">
									<font size="1">
										(Ф. И. О. работника таможенного представителя)
									</font>
								</td>
								<td style="width:5%"/>
								<td style="width:20%" class="HeaderMain">
									<font size="1">
										(подпись)
									</font>
								</td>
								<td style="width:5%"/>
								<td class="HeaderMain" style="width:30%">
									<font size="1">
										(дата и время получения требования)
									</font>
								</td>
							</tr>
						</table>
						<!--br/>
						<br/>
						<hr/>
						<font size="2">
							* Не действует в Республике Беларусь.
						</font-->
					</div>
				</xsl:if>
				<!--ДТЭГ Решение-->
				<xsl:if test="ecrc:CorrectDocType='1' and ecrc:DocKind='2'">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="3">
											<b>РЕШЕНИЕ<br/>таможенного органа о внесении изменений (дополнений)<br/>в сведения, заявленные в декларации на товары<br/>для экспресс-грузов, после выпуска товаров</b>
										</font>
									</td>
								</tr>
								<tr/>
								<tr>
									<td align="center" class="title">
										<font size="3">
											от <xsl:apply-templates select="ecrc:DecisionDateTime" mode="DateStr"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tr align="center">
								<td class="bordered" style="width:40%">
									<xsl:apply-templates select="ecrc:Customs/cat_ru:Code"/>
								</td>
								<td style="width:20%"/>
								<td class="bordered" style="width:40%">
									<xsl:apply-templates select="ecrc:BrokerName"/>
								</td>
							</tr>
						</table>
						<br/>
						<font size="2">В декларацию на товары для экспресс-грузов c регистрационным номером <xsl:choose>
								<xsl:when test="ecrc:ApplicationRegNumber">
									<u>
										<xsl:value-of select="ecrc:ApplicationRegNumber/cat_ru:CustomsCode"/>/<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,9,2)"/>
										<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,6,2)"/>
										<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="ecrc:ApplicationRegNumber/cat_ru:GTDNumber"/>/<xsl:value-of select="ecrc:ApplicationRegNumber/RUScat_ru:AddNumber"/>
									</u>
								</xsl:when>
								<xsl:otherwise>			
									 <u>                  </u> 			
								</xsl:otherwise>
							</xsl:choose> на основании подпункта <xsl:choose>
								<xsl:when test="ecrc:Subparagraph">
									<u>
										<xsl:value-of select="ecrc:Subparagraph"/>
									</u>
								</xsl:when>
								<xsl:otherwise>			
									 <u>    </u> 			
								</xsl:otherwise>
							</xsl:choose> пункта 27 Порядка совершения таможенных операций, связанных с изменением (дополнением) сведений, заявленных в декларации на товары для экспресс-грузов, утвержденного Решением Коллегии Евразийской экономической комиссии от 28 августа 2018 г. № 142, в связи с
							<br/>
						</font>
						<font size="2">
							<xsl:call-template name="inlinetable">
								<xsl:with-param name="data">
									<xsl:value-of select="ecrc:Reason"/>
								</xsl:with-param>
								<xsl:with-param name="data_align" select="'center'"/>
								<xsl:with-param name="descr">
									<xsl:text>(основания для внесения изменений (дополнений) в сведения, заявленные в ДТЭГ)</xsl:text>
								</xsl:with-param>
								<xsl:with-param name="width" select="'100%'"/>
							</xsl:call-template>
						</font>
						<br/>
						<font size="2">
							внесены изменения (дополнения) согласно прилагаемой КДТЭГ<!--*--><br/>
							<!--необходимо внести следующие изменения (дополнения)**:-->
						</font>
						<br/><br/>
						<!--
						<xsl:if test="ecrc:Consignment">
							<div style="width:100%; min-width:{$w}mm;">
								<table>
									<tbody>
										<tr class="title">
											<td class="HeaderMain bordered">
												№ п/п
											</td>
											<td class="HeaderMain bordered">
												Регистрационный<br/>номер ДТЭГ
											</td>
											<td class="HeaderMain bordered">
												Порядковый<br/>номер товара
											</td>
											<td class="HeaderMain bordered">
												Номер графы/<br/>колонки графы/<br/>строки
											</td>
											<td class="HeaderMain bordered">
												Сведения,<br/>заявленные в ДТЭГ
											</td>
											<td class="HeaderMain bordered">
												Измененные<br/>(дополненные)<br/>сведения
											</td>
										</tr>
										<xsl:for-each select="ecrc:Consignment/ecrc:ChangeDetails/ecrc:ChangeGoods">
											<tr>
												<td class="graphMain bordered">
													<xsl:value-of select="position()"/>
												</td>
												<td class="graphMain bordered">
													&#160;
												</td>
												<td class="graphMain bordered">
													<xsl:value-of select="ecrc:GoodsNumeric"/> - 
													<xsl:value-of select="ecrc:TotalGoodsNumeric"/>
												</td>
												<td class="graphMain bordered">
													<xsl:value-of select="ecrc:GRNumber"/>
												</td>
												<td class="graphMain bordered">
													<xsl:for-each select="ecrc:PreviousData">
														<xsl:if test="position()!=1">
															<br/>
														</xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</td>
												<td class="graphMain bordered">
													<xsl:for-each select="ecrc:CorrectData">
														<xsl:if test="position()!=1">
															<br/>
														</xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<br/-->
						<font size="2">
							<!--До 
							<xsl:call-template name="inlinetable">
								<xsl:with-param name="data">
									<xsl:apply-templates select="ecrc:LimitDateTime" mode="DateStr"/>
								</xsl:with-param>
								<xsl:with-param name="data_align" select="'center'"/>
								<xsl:with-param name="descr">
									<xsl:text>(срок в соответствии с пунктом 45 Порядка совершения таможенных операций, связанных с изменением (дополнением) сведений, заявленных в декларации на товары для экспресс-грузов)</xsl:text>
								</xsl:with-param>
								<xsl:with-param name="width" select="'150mm'"/>
							</xsl:call-template>
							<br/>необходимо представить КДТЭГ, а в случае уплаты таможенных платежей – также документы и (или) сведения, подтверждающие их уплату**.-->
						</font>
						<br/>
						<br/>
						<table>
							<tr>
								<td class="value graphMain" style="width:40%" align="center">
									<xsl:if test="ecrc:CustomsPerson/cat_ru:PersonName">
										<xsl:value-of select="ecrc:CustomsPerson/cat_ru:PersonName"/>
									</xsl:if>
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:30%">								
								</td>
								<td style="width:5%"/>
								<td class="bordered" style="width:20%" rowspan="2" align="center">
									<xsl:if test="ecrc:CustomsPerson/cat_ru:LNP">
										<xsl:value-of select="ecrc:CustomsPerson/cat_ru:LNP"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:40%" class="HeaderMain">
									<font size="1">
										(Ф. И. О. должностного лица таможенного органа)<!--*-->
									</font>
								</td>
								<td style="width:5%"/>
								<td style="width:30%" class="HeaderMain">
									<font size="1">
										(подпись)<!--*-->
									</font>
								</td>
								<td style="width:5%"/>
							</tr>
						</table>
						<br/>
						<br/>
						<table>
							<tr>
								<td class="value graphMain" style="width:40%" align="center">
									<xsl:if test="ecrc:BrokerPerson">
										<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:if test="ecrc:BrokerPerson/cat_ru:PersonMiddleName">
											<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:if>
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:20%">								
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:30%" align="center">
									<xsl:if test="ecrc:BrokerPerson/ecrc:IssueDate">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ecrc:BrokerPerson/ecrc:IssueDate"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:40%" class="HeaderMain">
									<font size="1">
										(Ф. И. О. работника таможенного представителя)
									</font>
								</td>
								<td style="width:5%"/>
								<td style="width:20%" class="HeaderMain">
									<font size="1">
										(подпись)
									</font>
								</td>
								<td style="width:5%"/>
								<td class="HeaderMain" style="width:30%">
									<font size="1">
										(дата получения решения)
									</font>
								</td>
							</tr>
						</table>
						<!--br/>
						<br/>
						<hr/>
						<font size="2">
							* Не действует в Республике Беларусь.<br/>
							** Для Республики Беларусь.
						</font-->
					</div>
				</xsl:if>
				<!--ПТДЭГ Требование-->
				<xsl:if test="ecrc:CorrectDocType='2' and ecrc:DocKind='1'">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="3">
											<b>ТРЕБОВАНИЕ<br/>о внесении изменений (дополнений) в сведения, заявленные<br/>в пассажирской таможенной декларации для экспресс-грузов,<br/>до выпуска товаров</b>
										</font>
									</td>
								</tr>
								<tr/>
								<tr>
									<td align="center" class="title">
										<font size="3">
											от <xsl:apply-templates select="ecrc:DecisionDateTime" mode="DateStr"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tr align="center">
								<td class="bordered" style="width:40%">
									<xsl:apply-templates select="ecrc:Customs/cat_ru:Code"/>
								</td>
								<td style="width:20%"/>
								<td class="bordered" style="width:40%">
									<xsl:apply-templates select="ecrc:BrokerName"/>
								</td>
							</tr>
						</table>
						<br/>
						<font size="2">В соответствии с пунктом 2 статьи 112 Таможенного кодекса Евразийского экономического союза уведомляем, что в ходе проведения таможенного контроля в отношении товаров и сведений, заявленных в пассажирской таможенной декларации для экспресс-грузов c регистрационным номером
							<xsl:choose>
								<xsl:when test="ecrc:ApplicationRegNumber">
									<u>
										<xsl:value-of select="ecrc:ApplicationRegNumber/cat_ru:CustomsCode"/>/<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,9,2)"/>
										<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,6,2)"/>
										<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="ecrc:ApplicationRegNumber/cat_ru:GTDNumber"/>/<xsl:value-of select="ecrc:ApplicationRegNumber/RUScat_ru:AddNumber"/>
									</u>
								</xsl:when>
								<xsl:otherwise>			
									 <u>                  </u> 			
								</xsl:otherwise>
							</xsl:choose>, выявлено следующее:<br/>
							<br/>
						</font>
						<font size="2">
							<table class="inlinetable" style="width: 100%;">
								<tbody>
									<tr align="left">
										<td class="value" width="100%">
											<xsl:for-each select="ecrc:IdentifiedViolations">
												<xsl:value-of select="."/>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
						</font>
						<br/>
						<br/>
						<font size="2">
							До 
							<xsl:choose>
								<xsl:when test="ecrc:LimitDateTime">
									<xsl:apply-templates select="ecrc:LimitDateTime" mode="DateStr"/>
								</xsl:when>
								<xsl:otherwise>
									"_____" __________________ 20____ г.
								</xsl:otherwise>
							</xsl:choose>
							 в таможенный орган необходимо представить корректировку пассажирской таможенной декларации для экспресс-грузов, заполненную в соответствии с Порядком заполнения корректировки пассажирской таможенной декларации для экспресс-грузов, утвержденным Решением Коллегии Евразийской экономической комиссии от 16 октября 2018 г. № 158, в связи с необходимостью внесения изменений (дополнений) в следующие сведения, заявленные в ПТДЭГ:
						</font><br/><br/>
						<xsl:if test="ecrc:Consignment">
							<!--table class="bordered">
								<tbody>
									<tr class="title">
										<td class="graphMain bordered">Сведения об индивидуальной накладной</td>
										<td class="graphMain bordered">Описание необходимости внесения изменений</td>
										<td class="graphMain bordered">Вносимые изменения</td>
									</tr-->
							<div style="width:100%; min-width:{$w}mm;">
								<table>
									<tbody>
										<tr class="title">
											<td class="HeaderMain bordered">
												№ п/п
											</td>
											<td class="HeaderMain bordered">
												Порядковый<br/>номер товара
											</td>
											<td class="HeaderMain bordered">
												Номер графы/<br/>колонки графы/<br/>строки
											</td>
											<td class="HeaderMain bordered">
												Сведения,<br/>заявленные в ПТДЭГ
											</td>
											<td class="HeaderMain bordered">
												Измененные<br/>(дополненные)<br/>сведения
											</td>
										</tr>
										<xsl:apply-templates select="ecrc:Consignment/ecrc:ChangeDetails">
											<xsl:with-param name="wdth" select="$w"/>
										</xsl:apply-templates>
									</tbody>
								</table>
							</div>
								<!--/tbody>
							</table-->
						</xsl:if>
						<br/>
						<table>
							<tr>
								<td class="value graphMain" style="width:40%" align="center">
									<xsl:if test="ecrc:CustomsPerson/cat_ru:PersonName">
										<xsl:value-of select="ecrc:CustomsPerson/cat_ru:PersonName"/>
									</xsl:if>
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:30%">								
								</td>
								<td style="width:5%"/>
								<td class="bordered" style="width:20%" rowspan="2" align="center">
									<xsl:if test="ecrc:CustomsPerson/cat_ru:LNP">
										<xsl:value-of select="ecrc:CustomsPerson/cat_ru:LNP"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:40%" class="HeaderMain">
									<font size="1">
										(Ф. И. О. должностного лица таможенного органа)<!--*-->
									</font>
								</td>
								<td style="width:5%"/>
								<td style="width:30%" class="HeaderMain">
									<font size="1">
										(подпись)<!--*-->
									</font>
								</td>
								<td style="width:5%"/>
							</tr>
						</table>
						<br/>
						<font size="3">
							<b>Требование получено:</b>
						</font>
						<br/>
						<br/>
						<table>
							<tr>
								<td class="value graphMain" style="width:40%" align="center">
									<xsl:if test="ecrc:BrokerPerson">
										<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:if test="ecrc:BrokerPerson/cat_ru:PersonMiddleName">
											<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:if>
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:20%">								
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:30%" align="center">
									<xsl:if test="ecrc:BrokerPerson/ecrc:IssueDate">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ecrc:BrokerPerson/ecrc:IssueDate"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:40%" class="HeaderMain">
									<font size="1">
										(Ф. И. О. работника таможенного представителя)
									</font>
								</td>
								<td style="width:5%"/>
								<td style="width:20%" class="HeaderMain">
									<font size="1">
										(подпись)
									</font>
								</td>
								<td style="width:5%"/>
								<td class="HeaderMain" style="width:30%">
									<font size="1">
										(дата и время получения требования)
									</font>
								</td>
							</tr>
						</table>
						<!--br/>
						<br/>
						<hr/>
						<font size="2">
						* Не действует в Республике Беларусь.
						</font-->
					</div>
				</xsl:if>
				<!--ПТДЭГ Решение-->
				<xsl:if test="ecrc:CorrectDocType='2' and ecrc:DocKind='2'">
					<div class="page" style="width: {$w}mm;">
						<table>
							<tbody>
								<tr>
									<td align="center" class="title">
										<font size="3">
											<b>РЕШЕНИЕ<br/>таможенного органа о внесении изменений (дополнений)<br/>в сведения, заявленные в пассажирской таможенной декларации<br/>для экспресс-грузов, после выпуска товаров</b>
										</font>
									</td>
								</tr>
								<tr/>
								<tr>
									<td align="center" class="title">
										<font size="3">
											от <xsl:apply-templates select="ecrc:DecisionDateTime" mode="DateStr"/>
										</font>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tr align="center">
								<td class="bordered" style="width:40%">
									<xsl:apply-templates select="ecrc:Customs/cat_ru:Code"/>
								</td>
								<td style="width:20%"/>
								<td class="bordered" style="width:40%">
									<xsl:apply-templates select="ecrc:BrokerName"/>
								</td>
							</tr>
						</table>
						<br/>
						<font size="2">В пассажирскую таможенную декларацию для экспресс-грузов c регистрационным номером <xsl:choose>
								<xsl:when test="ecrc:ApplicationRegNumber">
									<u>
										<xsl:value-of select="ecrc:ApplicationRegNumber/cat_ru:CustomsCode"/>/<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,9,2)"/>
										<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,6,2)"/>
										<xsl:value-of select="substring(ecrc:ApplicationRegNumber/cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="ecrc:ApplicationRegNumber/cat_ru:GTDNumber"/>/<xsl:value-of select="ecrc:ApplicationRegNumber/RUScat_ru:AddNumber"/>
									</u>
								</xsl:when>
								<xsl:otherwise>			
									 <u>                  </u> 			
								</xsl:otherwise>
							</xsl:choose> на основании подпункта <xsl:choose>
								<xsl:when test="ecrc:Subparagraph">
									<u>
										<xsl:value-of select="ecrc:Subparagraph"/>
									</u>
								</xsl:when>
								<xsl:otherwise>			
									 <u>    </u> 			
								</xsl:otherwise>
							</xsl:choose> пункта 29 Порядка совершения таможенных операций, связанных с изменением (дополнением) сведений, заявленных в пассажирской таможенной декларации для экспресс-грузов, утвержденного Решением Коллегии Евразийской экономической комиссии от 16 октября 2018 г. № 158, в связи с
							<br/>
						</font>
						<font size="2">
							<xsl:call-template name="inlinetable">
								<xsl:with-param name="data">
									<xsl:value-of select="ecrc:Reason"/>
								</xsl:with-param>
								<xsl:with-param name="data_align" select="'center'"/>
								<xsl:with-param name="descr">
									<xsl:text>(основания для внесения изменений (дополнений) в сведения, заявленные в ПТДЭГ)</xsl:text>
								</xsl:with-param>
								<xsl:with-param name="width" select="'100%'"/>
							</xsl:call-template>
						</font>
						<br/>
						<font size="2">
							внесены изменения (дополнения) согласно прилагаемой КПТДЭГ<!--*--><br/>
							<!--необходимо внести следующие изменения (дополнения),--><!--**:-->
						</font>
						<br/><br/>
						<!--xsl:if test="ecrc:Consignment">
							<div style="width:100%; min-width:{$w}mm;">
								<table>
									<tbody>
										<tr class="title">
											<td class="HeaderMain bordered">
												№ п/п
											</td>
											<td class="HeaderMain bordered">
												Регистрационный<br/>номер ПТДЭГ
											</td>
											<td class="HeaderMain bordered">
												Порядковый<br/>номер товара
											</td>
											<td class="HeaderMain bordered">
												Номер графы/<br/>колонки графы/<br/>строки
											</td>
											<td class="HeaderMain bordered">
												Сведения,<br/>заявленные в ПТДЭГ
											</td>
											<td class="HeaderMain bordered">
												Измененные<br/>(дополненные)<br/>сведения
											</td>
										</tr>
										<xsl:for-each select="ecrc:Consignment/ecrc:ChangeDetails/ecrc:ChangeGoods">
											<tr>
												<td class="graphMain bordered">
													<xsl:value-of select="position()"/>
												</td>
												<td class="graphMain bordered">
													&#160;
												</td>
												<td class="graphMain bordered">
													<xsl:value-of select="ecrc:GoodsNumeric"/> - 
													<xsl:value-of select="ecrc:TotalGoodsNumeric"/>
												</td>
												<td class="graphMain bordered">
													<xsl:value-of select="ecrc:GRNumber"/>
												</td>
												<td class="graphMain bordered">
													<xsl:for-each select="ecrc:PreviousData">
														<xsl:if test="position()!=1">
															<br/>
														</xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</td>
												<td class="graphMain bordered">
													<xsl:for-each select="ecrc:CorrectData">
														<xsl:if test="position()!=1">
															<br/>
														</xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</div>
						</xsl:if>
						<br/-->
						<font size="2">
							<!--До 
							<xsl:call-template name="inlinetable">
								<xsl:with-param name="data">
									<xsl:apply-templates select="ecrc:LimitDateTime" mode="DateStr"/>
								</xsl:with-param>
								<xsl:with-param name="data_align" select="'center'"/>
								<xsl:with-param name="descr">
									<xsl:text>(срок в соответствии с пунктом 48 Порядка совершения таможенных операций, связанных с изменением (дополнением) сведений, заявленных в пассажирской таможенной декларации для экспресс-грузов)</xsl:text>
								</xsl:with-param>
								<xsl:with-param name="width" select="'150mm'"/>
							</xsl:call-template>
							-->
							<!--br/>необходимо представить КПТДЭГ, а в случае уплаты таможенных платежей – также документы и (или) сведения, подтверждающие их уплату--><!--**-->.
						</font>
						<br/>
						<br/>
						<table>
							<tr>
								<td class="value graphMain" style="width:40%" align="center">
									<xsl:if test="ecrc:CustomsPerson/cat_ru:PersonName">
										<xsl:value-of select="ecrc:CustomsPerson/cat_ru:PersonName"/>
									</xsl:if>
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:30%">								
								</td>
								<td style="width:5%"/>
								<td class="bordered" style="width:20%" rowspan="2" align="center">
									<xsl:if test="ecrc:CustomsPerson/cat_ru:LNP">
										<xsl:value-of select="ecrc:CustomsPerson/cat_ru:LNP"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:40%" class="HeaderMain">
									<font size="1">
										(Ф. И. О. должностного лица таможенного органа)<!--*-->
									</font>
								</td>
								<td style="width:5%"/>
								<td style="width:30%" class="HeaderMain">
									<font size="1">
										(подпись)<!--*-->
									</font>
								</td>
								<td style="width:5%"/>
							</tr>
						</table>
						<br/>
						<br/>
						<table>
							<tr>
								<td class="value graphMain" style="width:40%" align="center">
									<xsl:if test="ecrc:BrokerPerson">
										<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonName"/>
										<xsl:text> </xsl:text>
										<xsl:if test="ecrc:BrokerPerson/cat_ru:PersonMiddleName">
											<xsl:value-of select="ecrc:BrokerPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:if>
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:20%">								
								</td>
								<td style="width:5%"/>
								<td class="value graphMain" style="width:30%" align="center">
									<xsl:if test="ecrc:BrokerPerson/ecrc:IssueDate">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="ecrc:BrokerPerson/ecrc:IssueDate"/>
										</xsl:call-template>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="width:40%" class="HeaderMain">
									<font size="1">
										(Ф. И. О. работника таможенного представителя)
									</font>
								</td>
								<td style="width:5%"/>
								<td style="width:20%" class="HeaderMain">
									<font size="1">
										(подпись)
									</font>
								</td>
								<td style="width:5%"/>
								<td class="HeaderMain" style="width:30%">
									<font size="1">
										(дата получения решения)
									</font>
								</td>
							</tr>
						</table>
						<!--br/>
						<br/>
						<hr/>
						<font size="2">
							* Не действует в Республике Беларусь.<br/>
							** Для Республики Беларусь.
						</font-->
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:AmountType -->
	<xsl:template match="ecrc:Amount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:if test="position() &gt; 1">
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Amount">
			<xsl:value-of select="translate(translate(format-number(RUScat_ru:Amount, '#,###.00'),',',' '),'.',',')"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:CurrencyCode"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ecrc:ApplicationRegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">
					<div class="title marg-top">Регистрационный номер ДТЭГ/ ПТДЭГ</div>
				</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="num_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа ecrc:ChangeDetailsType -->
	<!--xsl:template match="ecrc:ChangeDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ecrc:ChangeGoods">
				<table>
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">
								<xsl:text>Номер товара</xsl:text>
							</td>
							<td class="graphMain bordered">
								<xsl:text>Описание корректируемых сведений</xsl:text>
							</td>
							<td class="graphMain bordered">
								<xsl:text>Ранее указанные сведения</xsl:text>
							</td>
							<td class="graphMain bordered">
								<xsl:text>Измененные и (или) дополненные сведения</xsl:text>
							</td>
							<td class="graphMain bordered">
								<xsl:text>Измененная стоимость товара</xsl:text>
							</td>
						</tr>
						<xsl:for-each select="ecrc:ChangeGoods">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template-->
	<!-- Шаблон для типа ecrc:ChangeGoodsType -->
	<xsl:template match="ecrc:ChangeGoods|ecrc:ChangeDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
		<xsl:variable name="mainNumber">
			<xsl:choose>
				<xsl:when test="local-name() = 'ChangeGoods'">
					<xsl:value-of select="concat(count(../preceding-sibling::ecrc:ChangeDetails) + 1, '.')"/>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="$mainNumber"/>
				<xsl:value-of select="position()"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ecrc:GoodsNumeric"/> - <xsl:value-of select="ecrc:TotalGoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ecrc:GRNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="ecrc:PreviousData">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="ecrc:CorrectData">
					<xsl:if test="position()!=1">
						<br/>
					</xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</td>
		</tr>
		<xsl:apply-templates select="ecrc:ChangeGoods"/>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа ecrc:ConsignmentType -->
	<!--xsl:template match="ecrc:Consignment">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ecrc:ChangeDetails">
				<xsl:apply-templates select="ecrc:ChangeDetails">
					<xsl:with-param name="wdth" select="$w"/>
				</xsl:apply-templates>
			</xsl:if>
		</div>
	</xsl:template-->
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="ecrc:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ecrc:WayBillType -->
	<xsl:template match="ecrc:IndividualWayBill">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:value-of select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ID накладной в реестре</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ecrc:WayBillID"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Порядковый № накладной</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ecrc:ObjectOrdinal"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
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
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$descr"/>
					</td>
					<xsl:if test="$comma != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="*" mode="DateStr">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="DateStr">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="string-length($dateIn) &gt; 0 and substring($dateIn,1,4)!='0001'">
				<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
				"<u>
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</u>"
				 <u> 
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
				</u> <xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</u>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				"<u>     </u>"
				 <u>                  </u> 
				20<u>     </u> г.
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="//*[local-name()='CustomsBrokerCertificate']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
</xsl:stylesheet>
