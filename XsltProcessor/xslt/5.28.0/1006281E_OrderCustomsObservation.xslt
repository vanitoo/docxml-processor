<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:ordco="urn:customs.ru:Information:CustomsDocuments:OrderCustomsObservation:5.28.0">
	<!-- Шаблон для типа OrderCustomsObservationType -->
	<xsl:template match="ordco:OrderCustomsObservation">
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
				  .descr{
				  font-size:8pt;
				  }
                </style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain" style="table-layout: fixed;" width="100%">
						<tbody>
							<tr>
								<td style="width: 70mm;"></td>
								<td></td>
								<td style="width: 60mm;"></td>
							</tr>
							<tr>
								<td colspan="3" align="center" class="title">
									<font size="4">
										<xsl:text>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="value" colspan="3">
									<xsl:apply-templates select="ordco:Customs" mode="CustomsOffice"/>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="3" class="graphLittle">
									<xsl:text>(наименование таможенного органа)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="center" class="title">
									<font size="4">
										<b>
											<xsl:choose>
												<xsl:when test="ordco:DocType='0'">
													<xsl:text>СООБЩЕНИЕ</xsl:text>
													<br>о необходимости проведения таможенного наблюдения</br>
												</xsl:when>
												<xsl:when test="ordco:DocType='1'">
													<xsl:text>ПРЕДПИСАНИЕ</xsl:text>
													<br>на проведение таможенного наблюдения</br>
												</xsl:when>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td align="left">
									<xsl:call-template name="DateStr">
										<xsl:with-param select="ordco:OrderDate" name="date"/>
									</xsl:call-template>
								</td>
								<td align="right">
									<xsl:text>№ </xsl:text>
								</td>
								<td align="center" class="value">
									<xsl:apply-templates select="ordco:OrderNumber" mode="ord_number"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table width="100%" class="graphMain">
						<tbody>
							<tr>
								<td>
									<xsl:text>В соответствии с частью 9 статьи 214, частью 1 статьи 243 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации"</xsl:text>
									<br/>
									<br/>
									<xsl:text>ОБЯЗЫВАЮ:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="ordco:CustomsPerson">
										<xsl:apply-templates select="." mode="PersonBase"/>
										<xsl:if test="position()!=last()">
											<xsl:text>,&#160;</xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">
									<xsl:text>(должность, инициалы (отчество указывается при наличии) и фамилия лица  (лиц), которому(ым) поручается проведение таможенного наблюдения)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:choose>
										<xsl:when test="count(ordco:CustomsPerson)=1">
											<xsl:text>Служебное удостоверение № </xsl:text>
										</xsl:when>
										<xsl:otherwise>Служебные удостоверения № </xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:for-each select="ordco:CustomsPerson/ordco:PersonCustomsID">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>,&#160;</xsl:text>
										</xsl:if>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>провести таможенное наблюдение</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="ordco:ObservationKind='0' or ordco:ObservationKind='false' or ordco:ObservationKind='f'">
											<xsl:text>непосредственное таможенное наблюдение</xsl:text>
										</xsl:when>
										<xsl:when test="ordco:ObservationKind='1' or ordco:ObservationKind='true' or ordco:ObservationKind='t'">
											<xsl:text>опосредованное таможенное наблюдение</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:if test="ordco:ObservationDescr">
										<xsl:if test="ordco:ObservationKind">
											<xsl:text>,&#160;</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:for-each select="ordco:ObservationDescr">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text disable-output-escaping="yes"> </xsl:text>
										</xsl:if>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
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
									<xsl:choose>
										<xsl:when test="ordco:ObservationPlace">
											<xsl:for-each select="ordco:ObservationPlace">
												<xsl:apply-templates select="." mode="CustomsOffice"/>
												<xsl:text> </xsl:text>
												<xsl:if test="cat_ru:CustomsCountryCode">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="cat_ru:CustomsCountryCode"/>
													<xsl:text>) </xsl:text>
												</xsl:if>
												<!--xsl:for-each select="ordco:InformationTypeCode | ordco:InspPlaceName | ordco:InspPlaceDesc"-->
												<xsl:for-each select="*[local-name() = 'InformationTypeCode' or local-name() = 'InspPlaceName' or local-name() = 'InspPlaceDesc']">
													<xsl:if test="position() > 1">
														<xsl:text>, </xsl:text>
													</xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
												<xsl:text> </xsl:text>
												<!--xsl:apply-templates mode="CommaSeparate" select="ordco:Address"/-->
												<xsl:apply-templates select="ordco:Address" mode="ru_address"/>
												<xsl:if test="ordco:WarehousePlace">
													<xsl:text>,&#160;</xsl:text>
													<xsl:choose>
														<xsl:when test="ordco:WarehousePlace/ordco:DocumentModeCode=1">
															<xsl:text> Лицензия </xsl:text>
														</xsl:when>
														<xsl:when test="ordco:WarehousePlace/ordco:DocumentModeCode=2">
															<xsl:text> Свидетельство </xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="ordco:WarehousePlace/ordco:DocumentModeCode"/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:apply-templates select="ordco:WarehousePlace" mode="document"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>&#8212;&#8212;</xsl:text>
										</xsl:otherwise>
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
									<xsl:text>Товары, в том числе транспортные средства, являющиеся объектом таможенного контроля, а также физические лица, следующие через таможенную границу Евразийского экономического союза и находящиеся в зоне таможенного контроля или транзитной зоне международного
аэропорта:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="ordco:DTInfo | ordco:ObjectsControl | ordco:Goods">
											<xsl:apply-templates select="ordco:DTInfo"/>
											<xsl:if test="ordco:DTInfo and (ordco:ObjectsControl or ordco:Goods)">
												<xsl:text>, </xsl:text>
											</xsl:if>
											<xsl:for-each select="ordco:ObjectsControl">
												<xsl:value-of select="."/>
												<!--xsl:if test="position()!=last()">
													<xsl:text disable-output-escaping="yes"> </xsl:text>
												</xsl:if-->
											</xsl:for-each>
											<xsl:if test="ordco:ObjectsControl and ordco:Goods">
												<xsl:text>,</xsl:text>
											</xsl:if>
											<xsl:for-each select="ordco:Goods">
												<xsl:text> № </xsl:text>
												<xsl:value-of select="ordco:GoodsNumber"/>
												<xsl:text>&#160;</xsl:text>
												<xsl:for-each select="ordco:GoodsDescription">
													<xsl:value-of select="."/>
													<!--xsl:if test="position()!=last()">
														<xsl:text disable-output-escaping="yes"> </xsl:text>
													</xsl:if-->
												</xsl:for-each>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>&#8212;&#8212;</xsl:text>
										</xsl:otherwise>
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
									<xsl:text>Операции, при которых проводится таможенное наблюдение:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td class="value">
									<xsl:choose>
										<xsl:when test="ordco:OperationsCustObservation">
											<xsl:choose>
												<xsl:when test="ordco:OperationsCustObservation/ordco:OperationsCustObservationKind=1">
													<xsl:text>перевозка товаров и транспортных средств </xsl:text>
												</xsl:when>
												<xsl:when test="ordco:OperationsCustObservation/ordco:OperationsCustObservationKind=2">
													<xsl:text>грузовые операции </xsl:text>
												</xsl:when>
												<xsl:when test="ordco:OperationsCustObservation/ordco:OperationsCustObservationKind=3">
													<xsl:text>прочее </xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:for-each select="ordco:OperationsCustObservation/ordco:OperationsCustObservationDescr">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text disable-output-escaping="yes"> </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>&#8212;&#8212;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
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
									<xsl:text>с </xsl:text>
									<xsl:call-template name="DateStr">
										<xsl:with-param select="ordco:BeginDate" name="date"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(ordco:BeginTime,1,8)"/>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
						</tbody>
						<table width="100%" class="graphMain">
							<tbody>
								<tr>
									<td width="45%">
										<xsl:text>Начальник (заместитель начальника) таможенного органа</xsl:text>
									</td>
									<td class="value" width="15%"/>
									<td width="5%"/>
									<td valign="bottom" align="center" class="value" width="30%">
										<xsl:apply-templates select="ordco:CustomsChief" mode="InitialsSurname"/>
									</td>
								</tr>
								<tr>
									<td/>
									<td valign="top" align="center" class="graphLittle">
										<xsl:text>(подпись)</xsl:text>
									</td>
									<td/>
									<td valign="top" align="center" class="graphLittle">
										<xsl:text>(инициалы, фамилия) (отчество указывается при наличии)</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</table>
				</div>
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
	<xsl:template match="ordco:DTInfo">
		<xsl:choose>
			<xsl:when test="ordco:DTRegNum">
				<xsl:text>ДТ </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:DTRegNum"/>
			</xsl:when>
			<xsl:when test="ordco:TDRegNum">
				<xsl:text>ТД </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:TDRegNum"/>
			</xsl:when>
			<xsl:when test="ordco:AppRelNum">
				<xsl:text>Заявление о выпуске до подачи </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:AppRelNum"/>
			</xsl:when>
			<xsl:when test="ordco:TransportPP">
				<xsl:text>Уведомление о прибытии / убытии </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:TransportPP"/>
			</xsl:when>
			<xsl:when test="ordco:TIRIdDetails">
				<xsl:text>Книжка МДП </xsl:text>
				<xsl:value-of select="ordco:TIRIdDetails/catESAD_cu:TIRSeries"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="ordco:TIRIdDetails/catESAD_cu:TIRID"/>
			</xsl:when>
			<xsl:when test="ordco:ExpressNumber">
				<xsl:text>Реестр экспресс-грузов </xsl:text>
				<xsl:apply-templates mode="gtd_number" select="ordco:ExpressNumber"/>
				<xsl:if test="ordco:ExpressNumber/ordco:ExpressWayBill/ordco:HouseWaybill">
					<xsl:text>, инд. накладная(ые) </xsl:text>
					<xsl:for-each select="ordco:ExpressNumber/ordco:ExpressWayBill">
						<xsl:sort data-type="number" case-order="lower-first" select="ordco:ObjectOrdinal"/>
						<xsl:if test="position()!=1">, </xsl:if>
						<xsl:value-of select="ordco:HouseWaybill"/>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="ordco:ExpressNumber/ordco:ExpressWayBill/ordco:ObjectOrdinal">
					<xsl:text> № п/п </xsl:text>
					<xsl:for-each select="ordco:ExpressNumber/ordco:ExpressWayBill">
						<xsl:sort data-type="number" case-order="lower-first" select="ordco:ObjectOrdinal"/>
						<xsl:if test="position()!=1">, </xsl:if>
						<xsl:value-of select="ordco:ObjectOrdinal"/>
					</xsl:for-each>
				</xsl:if>
			</xsl:when>
			<xsl:when test="ordco:OtherDoc">
				<xsl:apply-templates select="ordco:OtherDoc" mode="document"/>
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
	<xsl:template mode="CommaSeparate" match="*">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
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
	<xsl:template match="*" mode="PersonBase">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>
			<xsl:text>&#160;</xsl:text>
		</xsl:if>
		<!--xsl:if test="cat_ru:PersonSurname">
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
		</xsl:if-->
		<xsl:apply-templates select="." mode="InitialsSurname"/>
	</xsl:template>
	<xsl:template match="*" mode="InitialsSurname">
		<xsl:if test="cat_ru:PersonName">
			<xsl:value-of select="concat(substring(cat_ru:PersonName, 1, 1), '.')"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:value-of select="concat(substring(cat_ru:PersonMiddleName, 1, 1), '.')"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonSurname">
			<xsl:text>&#160;</xsl:text>
			<xsl:value-of select="cat_ru:PersonSurname"/>
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
	<xsl:template mode="ord_number" match="*">
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
