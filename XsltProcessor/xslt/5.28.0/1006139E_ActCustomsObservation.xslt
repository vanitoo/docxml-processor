<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России № 196 от 6 февраля 2019 года, Приложение № 2 и № 3-->
<xsl:stylesheet version="1.0" xmlns:actco="urn:customs.ru:Information:CustomsDocuments:ActCustomsObservation:5.28.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="actco:ActCustomsObservation">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Акт таможенного наблюдения</title>
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
					table-layout: fixed;
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
					word-wrap:break-word
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
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td class="value" width="50%">
									<xsl:apply-templates select="actco:Customs" mode="CustomsOffice"/>
								</td>
								<td width="50%"/>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(наименование таможенного органа)</xsl:text>
								</td>
								<td/>
							</tr>
							<tr>
								<td colspan="2">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>АКТ</xsl:text>
											<br>таможенного наблюдения №</br>
											<u>
												<xsl:text>&#160;&#160;</xsl:text>
												<xsl:apply-templates mode="act_number" select="actco:ActNumber"/>
												<xsl:text>&#160;&#160;</xsl:text>
											</u>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td colspan="2">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td width="65%" align="left">Дата и время начала таможенного наблюдения </td>
								<td width="35%" class="value">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="actco:BeginDate"/>
									</xsl:call-template> 
									<xsl:value-of select="substring(string(actco:BeginTime),1,5)"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3" colspan="2">
									<br/>
								</td>
							</tr>
							<tr>
								<td width="65%" align="left">Дата и время окончания таможенного наблюдения </td>
								<td width="35%" class="value">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="actco:EndDate"/>
									</xsl:call-template> 
									<xsl:value-of select="substring(string(actco:EndTime),1,5)"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td>Основание для проведения таможенного наблюдения </td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="actco:Reason">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text disable-output-escaping="yes"> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Место проведения таможенного наблюдения:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="actco:ObservationPlace">
										<xsl:apply-templates select="." mode="CustomsOffice"/>
										<xsl:text> </xsl:text>
										<xsl:if test="cat_ru:CustomsCountryCode">
											<xsl:text> (</xsl:text>
											<xsl:value-of select="cat_ru:CustomsCountryCode"/>
											<xsl:text>) </xsl:text>
										</xsl:if>
										<xsl:text> </xsl:text>
										<!--xsl:for-each select="actco:InformationTypeCode | actco:InspPlaceName | actco:InspPlaceDesc"-->
										<xsl:for-each select="*[local-name() = 'InformationTypeCode' or local-name() = 'InspPlaceName' or local-name() = 'InspPlaceDesc']">
											<xsl:if test="position() > 1">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
										<xsl:text> </xsl:text>
										<!--xsl:apply-templates mode="CommaSeparate" select="actco:Address"/-->
										<xsl:apply-templates select="actco:Address" mode="ru_address"/>
										<xsl:if test="actco:WarehousePlace">
											<xsl:text>, </xsl:text>
											<xsl:choose>
												<xsl:when test="actco:WarehousePlace/actco:DocumentModeCode=1">
													<xsl:text> Лицензия </xsl:text>
												</xsl:when>
												<xsl:when test="actco:WarehousePlace/actco:DocumentModeCode=2">
													<xsl:text> Свидетельство </xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="actco:WarehousePlace/actco:DocumentModeCode"/>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:apply-templates select="actco:WarehousePlace" mode="document"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Товары, в том числе транспортные средства, являющиеся объектом таможенного контроля, а также физические лица, следующие через таможенную границу Евразийского экономического союза и находящиеся в зоне таможенного контроля или транзитной зоне международного аэропорта:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:apply-templates select="actco:DTInfo"/>
									<xsl:if test="actco:DTInfo and (actco:ObjectsControl or actco:Goods)">
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:for-each select="actco:ObjectsControl">
										<xsl:value-of select="."/>
										<!--xsl:if test="position()!=last()">
											<xsl:text disable-output-escaping="yes"> </xsl:text>
										</xsl:if-->
									</xsl:for-each>
									<xsl:if test="actco:ObjectsControl and actco:Goods">
										<xsl:text>,</xsl:text>
									</xsl:if>
									<xsl:for-each select="actco:Goods">
										<br/>
										<xsl:text> № позиции </xsl:text>
										<xsl:value-of select="actco:PPNumber"/>
										<xsl:if test="actco:RefGoodsNumber">
											<xsl:text> (№ п/п в предписании </xsl:text>
											<xsl:value-of select="actco:RefGoodsNumber"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<xsl:text> </xsl:text>
										<xsl:for-each select="actco:GoodsDescription">
											<xsl:value-of select="."/>
											<!--xsl:if test="position()!=last()">
												<xsl:text disable-output-escaping="yes"> </xsl:text>
											</xsl:if-->
										</xsl:for-each>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
								Вид наблюдения: <xsl:choose>
										<xsl:when test="(actco:ObservationKind='0') or (actco:ObservationKind='f') or (actco:ObservationKind='false')">[Х] - непосредственное  [ ] - опосредованное (с применением технических средств таможенного контроля (далее-ТСТК))</xsl:when>
										<xsl:when test="(actco:ObservationKind='1') or (actco:ObservationKind='t') or (actco:ObservationKind='true')">[ ] - непосредственное  [Х] - опосредованное (с применением технических средств таможенного контроля (далее-ТСТК))</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Применяемые ТСТК </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<span>
										<xsl:for-each select="actco:ApplicationTMCC">
											<xsl:if test="position() != 1"><br/></xsl:if>
											<xsl:value-of select="actco:KindCod"/> <xsl:value-of select="actco:Kind"/> <xsl:value-of select="actco:Number"/> 
										</xsl:for-each>
									</span>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">(вид ТСТК, инвентарные номера)</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Операции, при которых проводится таможенное наблюдение:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="actco:OperationsCustObservation/actco:OperationsCustObservationKind=1">
											<xsl:text>перевозка товаров и транспортных средств </xsl:text>
										</xsl:when>
										<xsl:when test="actco:OperationsCustObservation/actco:OperationsCustObservationKind=2">
											<xsl:text>грузовые операции </xsl:text>
										</xsl:when>
										<xsl:when test="actco:OperationsCustObservation/actco:OperationsCustObservationKind=3">
											<xsl:text>прочее </xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:for-each select="actco:OperationsCustObservation/actco:OperationsCustObservationDescr">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text disable-output-escaping="yes"> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="left">
									<xsl:choose>
										<xsl:when test="(actco:OperationsCustObservation='1')">[Х] - перевозка товаров и транспортных средств   [ ] - грузовые операции   [ ] - прочее</xsl:when>
										<xsl:when test="(actco:OperationsCustObservation='2')">[ ] - перевозка товаров и транспортных средств    [Х] - грузовые операции  [ ] - прочее</xsl:when>
										<xsl:when test="(actco:OperationsCustObservation='3')">[ ] - перевозка товаров и транспортных средств    [ ] - грузовые операции   [Х] - прочее</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Лица, осуществляющие операции</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="actco:PersonsInvolvedOperation">
										<xsl:apply-templates select="." mode="PersonBase"/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Описание процесса таможенного наблюдения и его результаты</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="actco:ProcessDescriptionResults">
										<xsl:value-of select="."/>
										<!--xsl:if test="position()!=last()">
											<xsl:text disable-output-escaping="yes"> </xsl:text>
										</xsl:if-->
									</xsl:for-each>
									<xsl:for-each select="actco:Goods">
										<br/>
										<xsl:text> № позиции </xsl:text>
										<xsl:value-of select="actco:PPNumber"/>
										<xsl:if test="actco:RefGoodsNumber">
											<xsl:text> (№ п/п в предписании </xsl:text>
											<xsl:value-of select="actco:RefGoodsNumber"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<xsl:text> </xsl:text>
										<xsl:for-each select="actco:ResultDescription">
											<xsl:value-of select="."/>
											<!--xsl:if test="position()!=last()">
												<xsl:text disable-output-escaping="yes"> </xsl:text>
											</xsl:if-->
										</xsl:for-each>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
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
												<td width="20%">
													<xsl:text>К акту прилагаются </xsl:text>
												</td>
												<td align="center" class="value" width="20%">
													<xsl:value-of select="actco:AddiSheetsNumber"/>
												</td>
												<td width="60%">
													<xsl:text> дополнительных листов, </xsl:text>
												</td>
											</tr>
											<tr>
												<td/>
												<td align="center" class="graphLittle">
													<xsl:text>(количество дополнительных листов)</xsl:text>
												</td>
												<td/>
											</tr>
											<tr>
												<td class="delim_3" colspan="3"/>
											</tr>
											<tr>
												<td class="value" colspan="3">
													<xsl:for-each select="actco:Application/actco:DocsInfo">
														<xsl:apply-templates select="." mode="document"/>
														<xsl:text> </xsl:text>
														<xsl:for-each select="actco:DocsDescription">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text> </xsl:text>
															</xsl:if>
														</xsl:for-each>
														<xsl:if test="actco:DocsQuantity">
															<xsl:text>, </xsl:text>
															<xsl:value-of select="actco:DocsQuantity"/>
															<xsl:text> шт.</xsl:text>
														</xsl:if>
														<xsl:if test="position()!=last()">
															<xsl:text>, </xsl:text>
														</xsl:if>
													</xsl:for-each>
													<xsl:if test="actco:Application/actco:FixInfo">
														<xsl:text>, </xsl:text>
														<xsl:for-each select="actco:Application/actco:FixInfo">
															<xsl:value-of select="."/>
															<xsl:if test="position()!=last()">
																<xsl:text> </xsl:text>
															</xsl:if>
														</xsl:for-each>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td colspan="3" align="center" class="graphLittle">
													<xsl:text>(описание приложений к акту)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="100%" class="graphMain">
						<tbody>
							<xsl:for-each select="actco:CustomsPerson">
								<tr>
									<td width="30%">
										<xsl:choose>
											<xsl:when test="position()=1">Должностные лица</xsl:when>
											<xsl:otherwise>
												<xsl:text disable-output-escaping="yes"> </xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td valign="bottom" align="center" class="value" width="70%">
										<xsl:apply-templates select="." mode="InitialsSurname"/>
									</td>
								</tr>
								<tr>
									<td/>
									<td valign="top" align="center" class="graphLittle">
										<xsl:text>(подпись, инициалы, фамилия) (отчество указывается при наличии)</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<br/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
				<xsl:if test="actco:AddSheet">
					<xsl:for-each select="actco:AddSheet">
						<div class="page">
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td class="value" width="50%">
											<xsl:apply-templates select="../actco:Customs" mode="CustomsOffice"/>
										</td>
										<td width="50%"/>
									</tr>
									<tr>
										<td align="center" class="graphLittle">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
										<td/>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center" class="title">
											<font size="4">
												<b>
													<xsl:text>ДОПОЛНИТЕЛЬНЫЙ ЛИСТ № </xsl:text>
													<u>
														<xsl:text>&#160;&#160;</xsl:text>
														<xsl:value-of select="actco:NumberSheet"/>
														<xsl:text>&#160;&#160;</xsl:text>
													</u>
													<br>к акту таможенного наблюдения № </br>
													<u>
														<xsl:text>&#160;&#160;</xsl:text>
														<xsl:apply-templates mode="act_number" select="../actco:ActNumber"/>
														<xsl:text>&#160;&#160;</xsl:text>
													</u>
												</b>
											</font>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="2">
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2">
											<xsl:call-template name="DateStr">
												<xsl:with-param select="../actco:ActDate" name="date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<table width="100%" class="graphMain">
								<tbody>
									<tr>
										<td>
											<xsl:text>Описание процесса таможенного наблюдения и его результаты</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td class="value">
											<xsl:for-each select="actco:Description">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text disable-output-escaping="yes"> </xsl:text>
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
								</tbody>
							</table>
							<table width="100%" class="graphMain">
								<tbody>
									<xsl:for-each select="../actco:CustomsPerson">
										<tr>
											<td width="30%">
												<xsl:choose>
													<xsl:when test="position()=1">Должностные лица</xsl:when>
													<xsl:otherwise>
														<xsl:text disable-output-escaping="yes"> </xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td valign="bottom" align="center" class="value" width="70%">
												<xsl:apply-templates select="." mode="InitialsSurname"/>
											</td>
										</tr>
										<tr>
											<td/>
											<td valign="top" align="center" class="graphLittle">
												<xsl:text>(подпись, инициалы, фамилия) (отчество указывается при наличии)</xsl:text>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<br/>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</xsl:for-each>
				</xsl:if>
			</body>
		</html>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="*" mode="ru_address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:variable name="xpath_AddressKindCode">
						<xsl:call-template name="get_xpath">
							<xsl:with-param name="node" select="RUScat_ru:AddressKindCode"/>
						</xsl:call-template>
					</xsl:variable>
					<element xml_node="{$xpath_AddressKindCode}">
						<xsl:choose>
							<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
							<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						</xsl:choose>
					</element>
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
							<xsl:variable name="xpath_AddressKindCode1">
								<xsl:call-template name="get_xpath">
									<xsl:with-param name="node" select="."/>
								</xsl:call-template>
							</xsl:variable>
							<element xml_node="{$xpath_AddressKindCode1}">
								<xsl:choose>
									<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
									<xsl:when test=".='2'">Фактический адрес: </xsl:when>
									<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								</xsl:choose>
							</element>
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
	<xsl:template match="actco:DTInfo">
		<xsl:choose>
			<xsl:when test="actco:DTRegNum">
				<xsl:text>ДТ </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="actco:DTRegNum"/>
			</xsl:when>
			<xsl:when test="actco:TDRegNum">
				<xsl:text>ТД </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="actco:TDRegNum"/>
			</xsl:when>
			<xsl:when test="actco:AppRelNum">
				<xsl:text>Заявление о выпуске до подачи </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="actco:AppRelNum"/>
			</xsl:when>
			<xsl:when test="actco:TransportPP">
				<xsl:text>Уведомление о прибытии / убытии </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="actco:TransportPP"/>
			</xsl:when>
			<xsl:when test="actco:TIRIdDetails">
				<xsl:text>Книжка МДП </xsl:text>
				<xsl:value-of select="actco:TIRIdDetails/catESAD_cu:TIRSeries"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="actco:TIRIdDetails/catESAD_cu:TIRID"/>
			</xsl:when>
			<xsl:when test="actco:OtherDoc">
				<xsl:apply-templates select="actco:OtherDoc" mode="document"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="gtd_number" match="*">
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:if test="./*[local-name()='AddNumber']">
			<xsl:choose>
				<xsl:when test="./*[local-name()='AddNumber'] = 'ЗВ'">В</xsl:when>
				<xsl:otherwise><xsl:value-of select="./*[local-name()='AddNumber']"/></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='GTDNumber']"/>
	</xsl:template>
	<xsl:template match="*" mode="InitialsSurname">
		<xsl:if test="cat_ru:PersonName">
			<xsl:value-of select="concat(substring(cat_ru:PersonName, 1, 1), '.')"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="concat(substring(cat_ru:PersonMiddleName, 1, 1), '.')"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonSurname"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="CommaSeparate" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="num_date" match="*">
		<xsl:param name="dateIn" select="."/>
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
	<xsl:template mode="act_number" match="*">
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='SerialNumber']"/>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;
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
				&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/>
				<u>
					<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="gtd"/>
		<xsl:choose>
			<xsl:when test="substring($gtd,5,1)='-' and substring($gtd,8,1)='-'">
				<xsl:value-of select="substring($gtd,9,2)"/>
				<xsl:value-of select="substring($gtd,6,2)"/>
				<xsl:value-of select="substring($gtd,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$gtd"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template name="Address">
		<xsl:if test="cat_ru:PostalCode">
			<xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
