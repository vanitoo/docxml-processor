<?xml version="1.0" encoding="UTF-8"?>
<!-- Решение комиссии таможенного союза Евразийского экономического сообщества от 20.05.2010 г. № 260 "О формах таможенных документов". 
- Акт таможенного досмота (таможенного осмотра).
Приказ ФТС России от 31 января 2013 г. N 179 "Об утверждении Инструкции о порядке заполнения, регистрации, хранения, учета актов таможенного досмотра (таможенного осмотра) товаров, пересылаемых в международных почтовых отправлениях".
- Акт таможенного досмотра (таможенного осмотра) товаров, пересылаемых в международных почтовых отправлениях. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ain="urn:customs.ru:Information:CustomsDocuments:ActInspection:5.28.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="ain:ActInspection">
		<xsl:variable name="valDirection">
			<xsl:choose>
				<xsl:when test="not(ain:Direction) and ain:Consignor/cat_ru:Address/cat_ru:CountryCode = 'RU'">1</xsl:when>
				<xsl:when test="not(ain:Direction) and ain:Consignee/cat_ru:Address/cat_ru:CountryCode = 'RU'">2</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="ain:Direction"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Акт таможенного досмотра (таможенного осмотра)</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
							
						div.page {
							width: 210mm;
							/*height: 297mm;*/
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	20mm;
							background: #ffffff;
							border: solid 1pt #000000;
							}
						
						div.goods {
							background: #ffffff;
							}
							
						.bordered {
							border: solid 1pt #000000;
							padding-top:4pt;
							padding-bottom:4pt;
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							}
							
						.underlined {
							border-bottom: solid 0.8pt #000000;
							}
							
						p.NumberDate {
							font-weight: bold;
							}
							
						.graph {
							font-family: Arial;
							font-size: 9pt;
							}
							
							.graphtop {
							font-family: Arial;
							font-size: 7pt;
							border-top:solid 0.8pt #000000;
							}

							
						.graphBold {
							font-family: Arial;
							font-size: 10pt;
							font-weight: bold;
							}
							
						td {
							font-family:Arial;
							font-size: 10pt;
							}
		
						.graphMain {
							font-family: Arial;
							font-size: 9pt;
							font-weight: bold;
							vertical-align: top;
							}
							
						.graphNo {
							font-size: 10pt;
							font-weight: bold;
							}
							
						.underlined {
							border-bottom: 1px solid black;
							vertical-align: bottom;
						}
					</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="(not(ain:MPOSign) or ain:MPOSign='0' or translate(substring(ain:MPOSign,1 ,1), 'F', 'f') = 'f') and not(ain:InspectionResults/ain:MPO) ">
						<div class="page">
							<table cellpadding="0" cellspacing="0" style="width:100%">
								<tbody>
									<tr>
										<td align="center" class="graphMain" style="width:100%">
											<xsl:for-each select="ain:Customs/*">
												<xsl:if test="position()!=1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(наименование таможенного органа)<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<xsl:choose>
											<xsl:when test="ain:ActType='1'">
												<td align="center" class="graphMain" style="width:100%">Акт таможенного осмотра<br/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td align="center" class="graphMain" style="width:100%">Акт таможенного досмотра<br/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">№<xsl:apply-templates select="ain:ActNumber"/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="right" class="" style="width:100%">
											<!--span class="underlined"><xsl:value-of select="ain:ActSheetNumber"/></span>листов
									<br/-->
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">Время начала таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра </xsl:when>
												<xsl:otherwise>досмотра </xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="substring(ain:BeginInspectionDate, 12, 8)"/>
											<br/>
											Дата <xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="ain:BeginInspectionDate"/>
											</xsl:call-template>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"> Настоящий акт составлен в соответствии со статьей 328 (327) Таможенного кодекса Евразийского экономического союза о том, что должностным (должностными) лицом (лицами):<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
											<xsl:for-each select="ain:ATDCustomsPerson">
												<xsl:if test="catESAD_ru:OfficialStatus = '1'">
													<xsl:apply-templates select="cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="cat_ru:PersonSurname"/> 
													<xsl:apply-templates select="cat_ru:PersonName"/> 
													<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
													<xsl:if test="position()!=last()">
														<xsl:text>, </xsl:text>
													</xsl:if>
												</xsl:if>
												<xsl:if test="catESAD_ru:OfficialStatus = '2'">
													<xsl:apply-templates select="cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="cat_ru:PersonSurname"/> 
													<xsl:apply-templates select="cat_ru:PersonName"/> 
													<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
													<xsl:if test="catESAD_ru:OTOFlag = '1'">(должностное лицо, не являющееся должностным лицом таможенного поста (ОТОиТК))</xsl:if> 
													<xsl:if test="catESAD_ru:OTOFlag = '2'">(уполномоченное должностное лицо таможенного поста (ОТОиТК))</xsl:if> 
													<xsl:apply-templates select="catESAD_ru:LawAct"/>
													<!--xsl:if test="catESAD_ru:SignatureFlag = 'false'">АТД не подписано</xsl:if>&#160;<xsl:if test="catESAD_ru:SignatureFlag = 'true'">АТД подписано</xsl:if--> 
													<xsl:apply-templates select="catESAD_ru:LNP"/> 
													<xsl:apply-templates select="catESAD_ru:CustomsCode"/>
													<xsl:if test="position()!=last()">
														<xsl:text>, </xsl:text>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(должность, фамилии, инициалы должностных лиц)</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											в присутствии <br/>
											декларанта, лица, обладающего полномочиями в отношении товаров (транспортных средств), либо их представителей:<br/>
											<xsl:if test="not(ain:InspectionParticipant/ain:Status=3)"><br/></xsl:if>
										</td>
									</tr>
									<xsl:if test="ain:InspectionParticipant[ain:Status=3 or ain:Status = 6]">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:for-each select="ain:InspectionParticipant[ain:Status=3 or ain:Status = 6]">
													<xsl:if test="ain:Job"> Место работы <xsl:apply-templates select="ain:Job"/>,</xsl:if>
													<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
													<xsl:if test="cat_ru:PersonSurname"> <xsl:apply-templates select="cat_ru:PersonSurname"/></xsl:if>
													<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
													<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
													<xsl:if test="ain:ParticipantDocs"> <xsl:apply-templates mode="card" select="ain:ParticipantDocs"/></xsl:if>
													<xsl:if test="ain:Address"> Место жительства <xsl:apply-templates select="ain:Address"/></xsl:if>
													<xsl:if test="position()!=last()">;<br/></xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/> понятых (на основании пункта 7 статьи 328 Таможенного кодекса Евразийского экономического союза):<br/>
											<xsl:for-each select="ain:InspectionParticipant[ain:Status = 4]">
												<xsl:if test="ain:Job"> Место работы <xsl:apply-templates select="ain:Job"/>,</xsl:if>
												<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
												<xsl:if test="cat_ru:PersonSurname"> <xsl:apply-templates select="cat_ru:PersonSurname"/></xsl:if>
												<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
												<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
												<xsl:if test="ain:ParticipantDocs"> <xsl:apply-templates mode="card" select="ain:ParticipantDocs"/></xsl:if>
												<xsl:if test="ain:Address"> Место жительства <xsl:apply-templates select="ain:Address"/></xsl:if>
												<xsl:if test="position()!=last()">;<br/></xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>с участием специалиста (эксперта):<br/>
											<xsl:for-each select="ain:InspectionParticipant[ain:Status = 5]">
												<xsl:if test="ain:Job"> Место работы <xsl:apply-templates select="ain:Job"/>,</xsl:if>
												<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
												<xsl:if test="cat_ru:PersonSurname"> <xsl:apply-templates select="cat_ru:PersonSurname"/></xsl:if>
												<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
												<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
												<xsl:if test="ain:ParticipantDocs"> <xsl:apply-templates mode="card" select="ain:ParticipantDocs"/></xsl:if>
												<xsl:if test="ain:Address"> Место жительства <xsl:apply-templates select="ain:Address"/></xsl:if>
												<xsl:if test="position()!=last()">;<br/></xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:FlagDeclarantAbsence='1' or ain:FlagDeclarantAbsence = 'true' or ain:FlagDeclarantAbsence = 't'">
													<span class="graphBold">x</span>
												</xsl:when>
												<xsl:when test="ain:FlagDeclarantAbsence='0' or ain:FlagDeclarantAbsence = 'false' or ain:FlagDeclarantAbsence = 'f'">
													<span class="graphBold">–</span>
												</xsl:when>
												<xsl:when test="not(ain:InspectionParticipant/ain:Status = 3)">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose> ]
							
													Таможенный досмотр проведен в отсутствие декларанта или иного лица, обладающего полномочиями в отношении товаров (их представителей) по причине:<xsl:value-of select="ain:ReasonDeclarantAbsence"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:ActType=0">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:ActType!=0">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
												– проведен таможенный досмотр</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:ActType=1">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:ActType!=1">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
												– проведен таможенный осмотр</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>товара (партии товаров либо транспортного средства), отправленного(й) отправителем (заполняется при вывозе): </td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
											<br/>
											<xsl:if test="$valDirection = 1">
												<xsl:apply-templates mode="org3" select="ain:Consignor"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (наименование организации; УНН/УНП/БИН, или ИИН/ИНН, или ПИН/ИНН и КПП; для физического лица – Ф.И.О., наименование и номер документа, удостоверяющего личность)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>из (в):<xsl:text> </xsl:text>
											<xsl:choose>
												<xsl:when test="$valDirection = 1">
													<xsl:value-of select="ain:Consignee/ain:DestinCountry"/>
												</xsl:when>
												<xsl:when test="$valDirection = 2">
													<xsl:value-of select="ain:Consignor/ain:DepartCountry"/>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (страна)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>в адрес получателя (заполняется при ввозе):
														</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
											<br/>
											<xsl:if test="$valDirection = 2">
												<xsl:apply-templates mode="org" select="ain:Consignee"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (наименование организации; УНН/УНП/БИН, или ИИН/ИНН, или ПИН/ИНН и КПП; для физического лица – Ф.И.О., наименование и номер документа, удостоверяющего личность)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/><xsl:text>по документам: </xsl:text>
											<xsl:for-each select="ain:DTNum">
												<xsl:apply-templates select="."/>
												<xsl:text>; </xsl:text>
											</xsl:for-each>
											<xsl:for-each select="ain:AccDocs">
												<xsl:value-of select="cat_ru:PrDocumentName"/> № <xsl:value-of select="cat_ru:PrDocumentNumber"/> от <xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
												<xsl:text> </xsl:text>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (таможенная декларация, книжка МДП, транспортные (перевозочные) документы, коммерческие и иные документы)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>Место проведения таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>
							Код таможенного органа <xsl:apply-templates select="ain:InspectionPlace/cat_ru:Code"/>
											<xsl:if test="ain:InspectionPlace/cat_ru:OfficeName">
							наименование таможенного органа <xsl:apply-templates select="ain:InspectionPlace/cat_ru:OfficeName"/>
												<br/>
											</xsl:if>
							Вид информации о месте досмотра (таможенного осмотра)
							 <xsl:choose>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 11">СВХ</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 21">ТС</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 25">Свободный склад</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 31">Склад получателя</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 39">Склад иной</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 51">Ж/д / название ж/д станции</xsl:when>
												<xsl:otherwise>Местонахождение ЗТК (адрес)</xsl:otherwise>
											</xsl:choose>
                    наименование места досмотра <xsl:apply-templates select="ain:InspectionPlace/ain:InspPlaceName"/> 
                    Описание места проведения досмотра (таможенного осмотра). Иная информация о месте досмотра<xsl:text> </xsl:text>
											<xsl:for-each select="ain:InspectionPlace/ain:InspPlaceDesc">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ain:InspectionPlace/ain:WarehousePlace" mode="doc"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ain:InspectionPlace/ain:InspAddress"/>
										</td>
									</tr>
									<xsl:if test="ain:UseTMCCSign=1 or translate( substring(ain:UseTMCCSign, 1, 1), 't', 'T') = 'T'">
										<tr>
											<td class="graph" style="width:100%">
												<br/>
									
							Применялись технические средства таможенного контроля:
                                    <!--<xsl:for-each select="ain:UseTMCC">
													<xsl:value-of select="."/>&#160;</xsl:for-each>-->
												<xsl:for-each select="ain:UseTMCC">
													<xsl:apply-templates select="ain:TSTKCode"/>
													<xsl:if test="ain:TSTK"> - <xsl:apply-templates select="ain:TSTK"/>
													</xsl:if>
													<xsl:if test="ain:Comments"> - <xsl:apply-templates select="ain:Comments"/>
													</xsl:if>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">Предъявлен:</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">[ <xsl:choose>
												<!--xsl:when test="not(ain:AMTInspResults) and not(ain:BusInspResults) and not(ain:TrailerInspResults) and not(ain:TruckInspResults) and not(ain:MotoInspResults)"-->
												<!--xsl:when test="ain:AMTInspResults or ain:BusInspResults or ain:TrailerInspResults or ain:TruckInspResults or ain:MotoInspResults or ain:InspTransport[ain:ArriveMode &lt; 4] or ain:ObjectType = 1"-->
												<xsl:when test="ain:ObjectType = 1">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose> ]
							– товар из 
												<xsl:choose>
													<xsl:when test="ain:NumberOfPlaces">
														<u><xsl:value-of select="ain:NumberOfPlaces"/></u>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text> ____ </xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												<!--xsl:value-of select="ain:NumberOfPlaces"/-->
												<xsl:text> </xsl:text>
											 мест. Вес брутто по документам <u>
												<xsl:choose>
													<xsl:when test="(ain:BruttoWeightDocs) and (ain:BruttoWeightDocs !='0')">
														<xsl:apply-templates select="ain:BruttoWeightDocs"/>
													</xsl:when>
													<xsl:otherwise>–</xsl:otherwise>
												</xsl:choose>
											</u> кг.</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">[ <xsl:choose>
												<!--xsl:when test="ain:InspTransport"-->
												<!--xsl:when test="ain:AMTInspResults or ain:BusInspResults or ain:TrailerInspResults or ain:TruckInspResults or ain:MotoInspResults"-->
												<!--xsl:when test="not(ain:AMTInspResults) and not(ain:BusInspResults) and not(ain:TrailerInspResults) and not(ain:TruckInspResults) and not(ain:MotoInspResults) and ain:InspTransport[ain:ArriveMode = 4]"-->
												<!--xsl:when test="not(ain:AMTInspResults) and not(ain:BusInspResults) and not(ain:TrailerInspResults) and not(ain:TruckInspResults) and not(ain:MotoInspResults) and ain:InspTransport[ain:ArriveMode = 3] or ain:ObjectType = 2"-->
												<xsl:when test="ain:ObjectType = 2">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose>
									] –  транспортное средство: регистрационный номер: <!--xsl:apply-templates select="ain:InspTransport[not(ain:ArriveMode)]/ain:InspTransportMean"/--> <xsl:apply-templates select="ain:InspTransport[ain:ArriveMode = 3]/ain:InspTransportMean"/>
									<xsl:if test="ain:InspTransport/ain:ContainerInfo">
												<xsl:apply-templates select="ain:InspTransport/ain:ContainerInfo/ain:ContainerIdentificator"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="graphBold" style="width:100%"><br/>В результате таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose> установлено следующее:</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"> Уровень радиационного фона составляет:
										<xsl:apply-templates select="ain:InspectionResults/ain:Radiation/ain:RadValue"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="ain:InspectionResults/ain:Radiation/ain:RadMeasure"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Измерения проводились прибором  <xsl:apply-templates select="ain:InspectionResults/ain:Radiation/ain:DeviceName"/> № <xsl:apply-templates select="ain:InspectionResults/ain:Radiation/ain:DeviceNumber"/>
										</td>
									</tr>
									<xsl:if test="ain:ActType=0">
										<tr>
											<td class="graph" style="width:100%">Фактический вес товара нетто <xsl:apply-templates select="ain:InspectionResults/ain:FactWeight/ain:Netto"/> кг, брутто <xsl:apply-templates select="ain:InspectionResults/ain:FactWeight/ain:Brutto"/>кг
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">определен способом:
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							[ <xsl:choose>
													<xsl:when test="//ain:InspectionResults/ain:FactWeight/ain:FWMethod=0">
														<span class="graphBold">х</span>
													</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
												</xsl:choose> ] фактического взвешивания
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							[ <xsl:choose>
													<xsl:when test="//ain:InspectionResults/ain:FactWeight/ain:FWMethod=1">
														<span class="graphBold">х</span>
													</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
												</xsl:choose> ] определения среднего веса одного места взвешиванием <xsl:apply-templates select="ain:InspectionResults/ain:FactWeight/ain:WeighPlacesNumber"/> мест,
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							вес которых составил соответственно: 
							<xsl:for-each select="ain:InspectionResults/ain:FactWeight/ain:PlaceWeight">
													<xsl:value-of select="."/>кг,
							</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							[ <xsl:choose>
													<xsl:when test="//ain:InspectionResults/ain:FactWeight/ain:FWMethod=2">
														<span class="graphBold">х</span>
													</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
												</xsl:choose> ] расчетным
							</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%;word-break: break-all;">
							[ <xsl:choose>
													<xsl:when test="//ain:InspectionResults/ain:FactWeight/ain:FWMethod=3">
														<span class="graphBold">х</span>
													</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
												</xsl:choose> ]  иным <xsl:apply-templates select="ain:InspectionResults/ain:FactWeight/ain:WFMetodsComments"/>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (указывается способ)<br/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
							Транспортное средство (транспортные средства) прибыло(и) в качестве товара:
							</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							[ <xsl:choose>
												<xsl:when test="(ain:InspTransport/ain:ArriveMode='1') or (ain:InspTransport/ain:ArriveMode='2')">
													<span class="graphBold">х</span>
												</xsl:when>
													<xsl:otherwise><span class="graphBold">–</span></xsl:otherwise>
											</xsl:choose>
							]  – 
							<xsl:choose>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='1'">на транспортном средстве, <del>в контейнере(ах),</del>
												</xsl:when>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='2'">
													<del>на транспортном средстве</del>, в контейнере(ах),</xsl:when>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='1'">номер(а) транспортных средств/<del>контейнеров:</del>
												</xsl:when>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='2'">
													<del>номер(а) транспортных средств</del>/контейнеров:</xsl:when>
											</xsl:choose>
											<xsl:if test="not(ain:InspTransport/ain:ArriveMode)">
												<xsl:text>на транспортном средстве, в контейнере(ах), номер(а) транспортных средств/контейнеров:</xsl:text>
											</xsl:if>
											<xsl:apply-templates select="ain:InspTransport[ain:ArriveMode='1' or ain:ArriveMode='2']/ain:InspTransportMean"/>
											<xsl:if test="ain:InspTransport/ain:ContainerInfo">
												<xsl:apply-templates select="ain:InspTransport/ain:ContainerInfo"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (ненужное зачеркнуть)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
									[ <xsl:choose>
												<xsl:when test="ain:InspTransport/ain:ArriveMode='3'">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose>
							]  – своим ходом <u>
												<xsl:apply-templates select="ain:InspTransport[ain:ArriveMode='3']/ain:InspTransportMean"/>
												<xsl:if test="ain:InspTransport/ain:ContainerInfo">
													<xsl:apply-templates select="ain:InspTransport/ain:ContainerInfo"/>
												</xsl:if>
											</u>
										</td>
									</tr>
									<tr>
										<td/>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Средства идентификации:	без средств идентификации [ <xsl:choose>
												<xsl:when test="ain:InspectionResults/ain:IdentifyMean">
													<span class="graphBold">–</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">х</span>
												</xsl:otherwise>
											</xsl:choose> ]
							</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
							средства идентификации	[ 
							<xsl:choose>
												<xsl:when test="(number(ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag)=0) or (ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag = 'false') or (ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag = 'f')">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose>	] – не нарушены	
							[ <xsl:choose>
												<xsl:when test="(number(ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag)=1) or (ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag = 'true') or (ain:InspectionResults/ain:IdentifyMean/ain:IdentBreakFlag = 't')">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="graphBold">–</span>
												</xsl:otherwise>
											</xsl:choose>	] – нарушены
							</td>
									</tr>
									<xsl:if test="ain:InspectionResults/ain:IdentifyMean">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:for-each select="ain:InspectionResults/ain:IdentifyMean">
													<xsl:if test="ain:IdentMeanState=1">Средство идентификации до начала проведения таможенного досмотра</xsl:if>
													<xsl:if test="ain:IdentMeanState=2">Средство идентификации после проведения таможенного досмотра (наложенные)</xsl:if>
													номер 
													<xsl:value-of select="ain:IdentNumber"/> вид 
													<xsl:if test="ain:IdentKind=1">пломба</xsl:if>
													<xsl:if test="ain:IdentKind=2">печать</xsl:if>
													<xsl:if test="ain:IdentKind=3">иное</xsl:if>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="ain:IdentDesc"/>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
												<xsl:if test="ain:InspectionResults/ain:IdentifyMean">
													<br/>
													<xsl:value-of select="count(ain:InspectionResults/ain:IdentifyMean)"/>
													<xsl:text> шт</xsl:text>
												</xsl:if>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (описание средства идентификации, количество)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:for-each select="ain:TextAct/ain:Paragraph">
												<xsl:if test="position() != 1"><br/></xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">
											<xsl:choose>
											<xsl:when test="ain:ActType='1'">(указывается результат осмотра)
											</xsl:when>
											<xsl:otherwise>(указывается результат досмотра)
											</xsl:otherwise>
										</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>К акту прилагаются: <xsl:value-of select="ain:InspectionResults/ain:ApplicMarks"/><xsl:if test="ain:InspectionResults/ain:PhotoQuantity">, фотографии в количестве <xsl:apply-templates select="ain:InspectionResults/ain:PhotoQuantity"/> шт.</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (документы, фотографии, этикетки и т.п.)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:choose>
												<xsl:when test="ain:Seize/ain:Presence = '0'">
													[ <span class="graphBold">х</span> ] Изъятий не производилось.
												</xsl:when>
												<xsl:otherwise>
													<s>[<b>–</b>] Изъятий не производилось.</s>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:choose>
												<xsl:when test="ain:PackingMonitoringFlag = '1'">
													[ <span class="graphBold">x</span> ] Грузовые места упакованы в нашем присутствии.
												</xsl:when>
												<xsl:otherwise>
													[ <span class="graphBold">–</span> ] Грузовые места упакованы в нашем присутствии.
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<xsl:if test="(ain:Seize/ain:SeizeAct) and (ain:ActType=0)">
										<tr>
											<td class="graph" style="width:100%">
												Произведен отбор проб и (или) образцов товаров по акту от 
												<xsl:apply-templates mode="russian_date" select="ain:Seize/ain:SeizeAct/cat_ru:PrDocumentDate"/>
							
							№ <xsl:apply-templates select="ain:Seize/ain:SeizeAct/cat_ru:PrDocumentNumber"/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
										<xsl:text>Обнаружены признаки правонарушений: </xsl:text>
										<!--xsl:choose>
											<xsl:when test="ain:InspectionResults/ain:AKArticles"-->
												<!--xsl:text> нарушены </xsl:text-->
												<xsl:for-each select="ain:InspectionResults/ain:AKArticles">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:text> ст.</xsl:text>
													<xsl:apply-templates select="ain:ArticleNumber"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="ain:PartNumber"/>
												</xsl:for-each>
											<!--/xsl:when>
											<xsl:otherwise-->
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="ain:InspectionResults/ain:AKParts"/>
											<!--/xsl:otherwise>
										</xsl:choose-->
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Наложены средства идентификации <xsl:apply-templates select="ain:InspectionResults/ain:NewIdentMarks"/> в количестве <xsl:apply-templates select="ain:InspectionResults/ain:NumberOfNewIdentMarks"/> шт
							</td>
									</tr>
									<xsl:for-each select="ain:ATDCustomsPerson">
										<tr>
											<td class="graph" style="width:100%">
							Должностные лица: <xsl:apply-templates select="." mode="FIO_inits"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:LNP"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:CustomsCode"/>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы, личная номерная печать)<br/>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="graph" style="width:100%">
							в присутствии
							
							<xsl:for-each select="//ain:InspectionParticipant[ain:Status ='3' or ain:Status ='4' or ain:Status = '6']">
										<xsl:apply-templates select="." mode="FIO_inits"/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Эксперт (специалист) 
									<xsl:for-each select="ain:InspectionParticipant[ain:Status ='5']">
										<xsl:if test="position() != 1">, </xsl:if>
										<xsl:apply-templates select="." mode="FIO_inits"/>
									</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
										</td>
									</tr>
									<!--xsl:if test="ain:TextAct">
										<tr>
											<td class="graph">
												<xsl:for-each select="ain:TextAct/ain:Paragraph">
													<xsl:apply-templates select="." mode="breakingComma"/>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (указываются результаты таможенного досмотра (таможенного осмотра))<br/>
											</td>
										</tr>
										<xsl:for-each select="ain:ATDCustomsPerson">
											<tr>
												<td class="graph" style="width:100%">
							Должностные лица: <xsl:apply-templates select="." mode="FIO_inits"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="catESAD_ru:LNP"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="catESAD_ru:CustomsCode"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы, личная номерная печать)<br/>
												</td>
											</tr>
										</xsl:for-each>
										<tr>
											<td class="graph" style="width:100%">
							в присутствии
							
							<xsl:for-each select="//ain:InspectionParticipant[ain:Status ='3' or ain:Status ='4' or ain:Status = '6']">
										<xsl:apply-templates select="." mode="FIO_inits"/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
											</td>
										</tr>
										<tr>
											<td class="graph" style="width:100%">
							Эксперт (специалист) 
												<xsl:for-each select="ain:InspectionParticipant[ain:Status ='5']">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:apply-templates select="." mode="FIO_inits"/>
												</xsl:for-each>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
											</td>
										</tr>
									</xsl:if-->
									<tr>
										<td class="graph" style="width:100%">Дата и время окончания таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра </xsl:otherwise>
											</xsl:choose>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="russian_date_time" select="ain:EndInspectionDate"/>
											<xsl:if test="ain:EndComposeDate">
												<xsl:text> </xsl:text>(время завершения составления акта <xsl:apply-templates mode="russian_date_time" select="ain:EndComposeDate"/>)</xsl:if>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td class="graph" style="width:40%">
										Второй экземпляр акта получил на руки 
										</td>
														<td align="center" class="graph" style="width:20%">
															<xsl:apply-templates mode="russian_date" select="ain:SecExempDate"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates mode="russian_time" select="ain:SecExempTime"/>
														</td>
														<td>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td align="center" class="graph" style="width:20%">
															<xsl:apply-templates select="ain:InspectionParticipant[ain:ATDReceiveCopy='1' or ain:ATDReceiveCopy='t' or ain:ATDReceiveCopy='true']" mode="FIO_inits"/>
												</td>
													</tr>
													<tr>
														<td align="center" class="graphtop" style="width:40%">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<br/>
														</td>
														<td align="center" class="graphtop" style="width:20%">(дата, время)<br/>
														</td>
														<td align="center" class="graphtop" style="width:20%"> (подпись)<br/>
														</td>
														<td align="center" class="graphtop" style="width:20%"> (фамилия, инициалы)<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
								Служебные отметки (заполняются только в экземпляре для таможенных органов): <xsl:for-each select="ain:CustomsMark">
												<xsl:apply-templates select="."/> </xsl:for-each>
											<br/>
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</div>
					</xsl:when>
					<xsl:when test="ain:MPOSign='1' or translate(substring(ain:MPOSign,1 ,1), 'T', 't') = 't' or ain:InspectionResults/ain:MPO">
						<div class="page">
							<table cellpadding="0" cellspacing="0" style="width:100%">
								<tbody>
									<tr>
										<td align="center" class="graphMain" style="width:100%">
											<xsl:for-each select="ain:Customs/*">
												<xsl:if test="position()!=1">, </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(наименование таможенного органа)<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<xsl:choose>
											<xsl:when test="ain:ActType='1'">
												<td align="center" class="graphMain" style="width:100%">Акт таможенного осмотра
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td align="center" class="graphMain" style="width:100%">Акт таможенного досмотра
												</td>
											</xsl:otherwise>
										</xsl:choose>
									</tr>
									<tr>
										<td align="center" class="graphMain" style="width:100%">
											<xsl:text>товаров, пересылаемых в международных почтовых отправлениях</xsl:text><br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">№<xsl:apply-templates select="ain:ActNumber"/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="right" class="" style="width:100%">
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">Время начала таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра </xsl:when>
												<xsl:otherwise>досмотра </xsl:otherwise>
											</xsl:choose>
											<xsl:value-of select="substring(ain:BeginInspectionDate, 12, 8)"/>
											<br/>
											Дата <xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="ain:BeginInspectionDate"/>
											</xsl:call-template>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"> Настоящий акт составлен на основании статьи 328 (327) Таможенного кодекса Евразийского экономического союза должностным лицом (должностными лицами):<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph" style="width:100%">
											<xsl:for-each select="ain:ATDCustomsPerson">
												<xsl:if test="catESAD_ru:OfficialStatus = '1'">
													<xsl:value-of select="cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="cat_ru:PersonSurname"/> 
													<xsl:apply-templates select="cat_ru:PersonName"/> 
													<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
													<xsl:if test="position()!=last()">
														<xsl:text>, </xsl:text>
													</xsl:if>
												</xsl:if>
												<xsl:if test="catESAD_ru:OfficialStatus = '2'">
													<xsl:apply-templates select="cat_ru:PersonPost"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="cat_ru:PersonSurname"/> 
													<xsl:apply-templates select="cat_ru:PersonName"/> 
													<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
													<xsl:if test="catESAD_ru:OTOFlag = '1'">(должностное лицо, не являющееся должностным лицом таможенного поста(ОТОиТК))</xsl:if> 
													<xsl:if test="catESAD_ru:OTOFlag = '2'">(уполномоченное должностное лицотаможенного поста(ОТОиТК))</xsl:if> 
													<xsl:apply-templates select="catESAD_ru:LawAct"/> 
													<xsl:apply-templates select="catESAD_ru:LNP"/> 
													<xsl:apply-templates select="catESAD_ru:CustomsCode"/>
													<xsl:if test="position()!=last()">
														<xsl:text>, </xsl:text>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(должность, фамилии, инициалы должностных лиц)</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%;">
											в присутствии: 
											<xsl:for-each select="ain:InspectionParticipant">
												<xsl:choose>
													<xsl:when test="ain:Status ='6'">
														<u>оператора почтовой связи</u>
														<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
													</xsl:when>
													<xsl:when test="ain:Status ='3'">
														<u>декларанта или иного лица, обладающего полномочиями в отношении товаров (их представителей)</u>
														<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
													</xsl:when>
													<xsl:when test="ain:Status ='4'">
														<u>понятых</u>
														<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:for-each select="ain:InspectionParticipant">
												<xsl:choose>
													<xsl:when test="ain:Status ='6'">оператор почтовой связи<xsl:if test="ain:Job"> Место работы <xsl:apply-templates select="ain:Job"/>,</xsl:if>
														<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="." mode="FIO_inits"/>
														<xsl:if test="ain:ParticipantDocs"> <xsl:apply-templates mode="card" select="ain:ParticipantDocs"/></xsl:if>
														<xsl:if test="ain:Address"> Место жительства <xsl:apply-templates select="ain:Address"/></xsl:if>
														<xsl:if test="position()!=last()"><br/></xsl:if>
													</xsl:when>
													<xsl:when test="ain:Status ='3'">декларант или иное лицо, обладающее полномочиями в отношении товаров<xsl:if test="ain:Job"> Место работы <xsl:apply-templates select="ain:Job"/>,</xsl:if>
														<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="." mode="FIO_inits"/>
														<xsl:if test="ain:ParticipantDocs"> <xsl:apply-templates mode="card" select="ain:ParticipantDocs"/></xsl:if>
														<xsl:if test="ain:Address"> Место жительства <xsl:apply-templates select="ain:Address"/></xsl:if>
														<xsl:if test="position()!=last()"><br/></xsl:if>
													</xsl:when>
													<xsl:when test="ain:Status ='4'">понятой<xsl:if test="ain:Job"> Место работы <xsl:apply-templates select="ain:Job"/>,</xsl:if>
														<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="." mode="FIO_inits"/>
														<xsl:if test="ain:ParticipantDocs"> <xsl:apply-templates mode="card" select="ain:ParticipantDocs"/></xsl:if>
														<xsl:if test="ain:Address"> Место жительства <xsl:apply-templates select="ain:Address"/></xsl:if>
														<xsl:if test="position()!=last()"><br/></xsl:if>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>с участием специалиста (эксперта):<br/>
											<xsl:for-each select="ain:InspectionParticipant[ain:Status='5']">
													специалист<xsl:if test="ain:Job"> Место работы <xsl:apply-templates select="ain:Job"/>,</xsl:if>
													<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="." mode="FIO_inits"/>
													<xsl:if test="ain:ParticipantDocs"> <xsl:apply-templates mode="card" select="ain:ParticipantDocs"/></xsl:if>
													<xsl:if test="ain:Address"> Место жительства <xsl:apply-templates select="ain:Address"/></xsl:if>
													<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:for-each>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>Таможенный досмотр проведен в отсутствие декларанта или иного лица, обладающего полномочиями в отношении товаров (их представителей) по причине: <xsl:apply-templates select="ain:ReasonDeclarantAbsence"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:ActType=0">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:ActType!=0">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
												– проведен таможенный досмотр</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>[ <xsl:choose>
												<xsl:when test="ain:ActType=1">
													<span class="graphBold">х</span>
												</xsl:when>
												<xsl:when test="ain:ActType!=1">
													<span class="graphBold">–</span>
												</xsl:when>
											</xsl:choose> ]
							
												– проведен таможенный осмотр</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>Место проведения таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose>: Код таможенного органа <xsl:apply-templates select="ain:InspectionPlace/cat_ru:Code"/>
											<xsl:if test="ain:InspectionPlace/cat_ru:OfficeName">
												наименование таможенного органа <xsl:apply-templates select="ain:InspectionPlace/cat_ru:OfficeName"/>
												<br/>
											</xsl:if>
											Вид информации о месте досмотра (таможенного осмотра)
											 <xsl:choose>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 11">СВХ</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 21">ТС</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 25">Свободный склад</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 31">Склад получателя</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 39">Склад иной</xsl:when>
												<xsl:when test="ain:InspectionPlace/ain:InformationTypeCode = 51">Ж/д / название ж/д станции</xsl:when>
												<xsl:otherwise>Местонахождение ЗТК (адрес)</xsl:otherwise>
											</xsl:choose>
											наименование места досмотра <xsl:apply-templates select="ain:InspectionPlace/ain:InspPlaceName"/> 
											Описание места проведения досмотра (таможенного осмотра). Иная информация о месте досмотра
											<xsl:text> </xsl:text>
											<xsl:for-each select="ain:InspectionPlace/ain:InspPlaceDesc">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ain:InspectionPlace/ain:WarehousePlace" mode="doc"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ain:InspectionPlace/ain:InspAddress"/>
										</td>
									</tr>
									<xsl:if test="ain:UseTMCCSign=1 or translate( substring(ain:UseTMCCSign, 1, 1), 't', 'T') = 'T'">
										<tr>
											<td class="graph" style="width:100%">
												<br/>
										
								Применялись технические средства таможенного контроля: <xsl:for-each select="ain:UseTMCC">
													<xsl:apply-templates select="ain:TSTKCode"/>
													<xsl:if test="ain:TSTK"> - <xsl:apply-templates select="ain:TSTK"/>
													</xsl:if>
													<xsl:if test="ain:Comments"> - <xsl:apply-templates select="ain:Comments"/>
													</xsl:if>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
												<xsl:if test="ain:VOIActNumber">
													<br/>Акт осмотра с ИДК № <xsl:apply-templates select="ain:VOIActNumber"/>
												</xsl:if>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
											<br/>
											Предъявлено международное почтовое отправление № 
											<xsl:apply-templates select="ain:InspectionResults/ain:MPO/ain:MPO_Number"/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<br/>
											<xsl:if test="$valDirection = '1'">
												Сведения об <u>отправителе (вывоз)</u>/получателе (ввоз): 
											</xsl:if>
											<xsl:if test="$valDirection = '2'">
												Сведения об отправителе (вывоз)/<u>получателе (ввоз)</u>: 
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:if test="$valDirection='1'">
												<xsl:apply-templates mode="org2" select="ain:Consignor"/>
											</xsl:if>
											<xsl:if test="$valDirection='2'">
												<xsl:apply-templates mode="org2" select="ain:Consignee"/>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (для юридического лица - наименование организации, адрес;<br/>
для физического лица – Ф.И.О., место жительства)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%"> В результате таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра</xsl:otherwise>
											</xsl:choose> установлено следующее:</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">Фактический вес товара брутто <xsl:apply-templates select="ain:InspectionResults/ain:MPO/ain:MPOGrossWeightQuantity"/> кг определен способом фактического взвешивания
							</td>
									</tr>
									<xsl:if test="ain:TextAct">
										<tr>
											<td class="graph">
												<xsl:for-each select="ain:TextAct/ain:Paragraph">
														<xsl:apply-templates select="." mode="breakingComma"/>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="(translate(ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag, 'TRUE', 'true') = 'true' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag = 1) and ain:InspectionResults/ain:MPO/ain:DamageDesc">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:text>Повреждения МПО: </xsl:text>
												<xsl:apply-templates select="ain:InspectionResults/ain:MPO/ain:DamageDesc"/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td align="center" class="graphtop" style="width:100%;font-family: Arial; font-size: 7pt;">(указываются результаты таможенного досмотра (таможенного осмотра))</td>
									</tr>
									<xsl:if test="ain:InspectionResults/ain:ViolationSign='0' or ain:InspectionResults/ain:ViolationSign='f' or ain:InspectionResults/ain:ViolationSign='false'">
										<tr>
											<td class="graph" style="width:100%">Нарушений таможенного законодательства не выявлено</td>
										</tr>
									</xsl:if>
									<xsl:variable name="MPOname" select="ain:InspectionResults/ain:MPO/ain:MPO_Name"/>
									<xsl:if test="ain:InspectionResults/ain:ViolationSign">
										<tr>
											<td class="graph" style="width:100%">Выявлены нарушения таможенного законодательства: <xsl:apply-templates select="ain:InspectionResults/ain:ViolationDescription"/></td>
										</tr>
									</xsl:if>
									<xsl:if test="ain:InspectionResults/ain:ViolationSign='1' or ain:InspectionResults/ain:ViolationSign='t' or ain:InspectionResults/ain:ViolationSign='true'">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:choose>
													<xsl:when test="$MPOname='1'">почтовая карточка</xsl:when>
													<xsl:when test="$MPOname='2'">письмо</xsl:when>
													<xsl:when test="$MPOname='3'">бандероль</xsl:when>
													<xsl:when test="$MPOname='4'">мелкий пакет</xsl:when>
													<xsl:when test="$MPOname='5'">секограмма</xsl:when>
													<xsl:when test="$MPOname='6'">посылка</xsl:when>
													<xsl:when test="$MPOname='7'">мешок «М»</xsl:when>
													<xsl:when test="$MPOname='8'">отправление EMS</xsl:when>
													<xsl:otherwise>аэрограмма</xsl:otherwise>
												</xsl:choose>
												№ <xsl:apply-templates select="ain:InspectionResults/ain:MPO/ain:MPO_Number"/>, Повреждения МПО <xsl:choose>
													<xsl:when test="ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='1' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='t' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='true'">присутствуют: <xsl:apply-templates select="ain:InspectionResults/ain:DamageDesc"/>
													</xsl:when>
													<xsl:otherwise>отсутствуют</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--tr>
											<td class="graph" style="width:100%">Товары: 
												<xsl:for-each select="ain:InspectionResults/ain:InspGoods">
													<br/>
													<xsl:value-of select="position()"/>). <xsl:apply-templates select="."/>
													<br/>
												</xsl:for-each>
											</td>
										</tr-->
									</xsl:if>
									<xsl:if test="not(ain:InspectionResults/ain:ViolationSign)">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:choose>
													<xsl:when test="$MPOname='1'">почтовая карточка</xsl:when>
													<xsl:when test="$MPOname='2'">письмо</xsl:when>
													<xsl:when test="$MPOname='3'">бандероль</xsl:when>
													<xsl:when test="$MPOname='4'">мелкий пакет</xsl:when>
													<xsl:when test="$MPOname='5'">секограмма</xsl:when>
													<xsl:when test="$MPOname='6'">посылка</xsl:when>
													<xsl:when test="$MPOname='7'">мешок «М»</xsl:when>
													<xsl:when test="$MPOname='8'">отправление EMS</xsl:when>
													<xsl:otherwise>аэрограмма</xsl:otherwise>
												</xsl:choose>
												№ <xsl:apply-templates select="ain:InspectionResults/ain:MPO/ain:MPO_Number"/>, Повреждения МПО <xsl:choose>
													<xsl:when test="ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='1' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='t' or ain:InspectionResults/ain:MPO/ain:MPO_DamageFlag='true'">присутствуют: <xsl:value-of select="ain:InspectionResults/ain:MPO/ain:DamageDesc"/>
													</xsl:when>
													<xsl:otherwise>отсутствуют</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<!--tr>
											<td class="graph" style="width:100%">Товары <xsl:for-each select="ain:InspectionResults/ain:InspGoods">
													<xsl:value-of select="position()"/>). <xsl:apply-templates select="."/>
													<br/>
												</xsl:for-each>
											</td>
										</tr-->
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:for-each select="ain:InspectionResults/ain:IdentifyMean">
												<xsl:if test="ain:IdentMeanState=1">Средство идентификации до начала проведения таможенного досмотра</xsl:if>
												<xsl:if test="ain:IdentMeanState=2">Средство идентификации после проведения таможенного досмотра (наложенные)</xsl:if>
							номер 
							<xsl:apply-templates select="ain:IdentNumber"/> вид 
							<xsl:if test="ain:IdentKind=1">пломба</xsl:if>
												<xsl:if test="ain:IdentKind=2">печать</xsl:if>
												<xsl:if test="ain:IdentKind=3">иное</xsl:if>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="ain:IdentDesc"/>
												<br/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"/>
									</tr>
									<tr>
										<td class="graph" style="width:100%"/>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							К акту прилагаются: <xsl:apply-templates select="ain:InspectionResults/ain:ApplicMarks"/><xsl:if test="ain:InspectionResults/ain:PhotoQuantity">, фотографии в количестве <xsl:apply-templates select="ain:InspectionResults/ain:PhotoQuantity"/> шт.</xsl:if>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (документы, фотографии, этикетки и т.п.)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:choose>
												<xsl:when test="ain:Seize/ain:Presence = '0'">
								[ <span class="graphBold">х</span> ] Изъятий не производилось.
									</xsl:when>
												<xsl:otherwise>
													<s>[<b>–</b>] Изъятий не производилось.</s>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<xsl:if test="(ain:Seize/ain:SeizeAct) and (ain:ActType=0)">
										<tr>
											<td class="graph" style="width:100%">
							Произведен отбор проб и (или) образцов товаров по акту от 
							<xsl:apply-templates mode="russian_date" select="ain:Seize/ain:SeizeAct/cat_ru:PrDocumentDate"/>
							
							№ <xsl:apply-templates select="ain:Seize/ain:SeizeAct/cat_ru:PrDocumentNumber"/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%">
											<xsl:text>Обнаружены признаки правонарушений: </xsl:text>
												<xsl:for-each select="ain:InspectionResults/ain:AKArticles">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:text> ст.</xsl:text>
													<xsl:apply-templates select="ain:ArticleNumber"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="ain:PartNumber"/>
												</xsl:for-each>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="ain:InspectionResults/ain:AKParts"/>
										</td>
									</tr>
									<!--<tr>
										<td style="width:100%" class="graph">
							Наложены средства идентификации <xsl:value-of select="ain:InspectionResults/ain:NewIdentMarks"/> в количестве <xsl:value-of select="ain:InspectionResults/ain:NumberOfNewIdentMarks"/> шт
							</td>
									</tr>-->
									<xsl:for-each select="ain:ATDCustomsPerson[translate(substring(*[local-name() = 'SignatureFlag'], 1, 1), 't', 'T') = 'T' or *[local-name() = 'SignatureFlag'] = 1]">
										<tr>
											<td class="graph" style="width:100%">
							Должностное лицо (должностные лица): <xsl:apply-templates select="." mode="FIO_inits"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:LNP"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="catESAD_ru:CustomsCode"/>
											</td>
										</tr>
										<tr>
											<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы, личная номерная печать)<br/>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="graph" style="width:100%">
							в присутствии
									<xsl:for-each select="ain:InspectionParticipant[ain:Status='3' or ain:Status='6' or ain:Status='4']">
										<xsl:if test="position() != 1">, </xsl:if>
										<xsl:apply-templates select="." mode="FIO_inits"/>
									</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" style="width:100%">
							Эксперт (специалист) 
										<xsl:for-each select="ain:InspectionParticipant[ain:Status ='5']">
											<xsl:if test="position()!=1">, </xsl:if>
											<xsl:apply-templates select="." mode="FIO_inits"/>
										</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%"> (подпись, фамилия, инициалы)<br/>
										</td>
									</tr>
									<xsl:if test="ain:InspectionFinal">
										<tr>
											<td class="graph" style="width:100%">
												<xsl:choose>
													<xsl:when test="ain:ActType='1'">Осмотр </xsl:when>
													<xsl:otherwise>Досмотр </xsl:otherwise>
												</xsl:choose>
												<xsl:choose>
													<xsl:when test="ain:InspectionFinal='true' or ain:InspectionFinal='t' or ain:InspectionFinal='1'">завершен</xsl:when>
													<xsl:when test="ain:InspectionFinal='false' or ain:InspectionFinal='f' or ain:InspectionFinal='0'">не завершен</xsl:when>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="graph" style="width:100%"><br/>Дата и время окончания таможенного <xsl:choose>
												<xsl:when test="ain:ActType='1'">осмотра</xsl:when>
												<xsl:otherwise>досмотра </xsl:otherwise>
											</xsl:choose>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="russian_date_time" select="ain:EndInspectionDate"/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td class="graph" colspan="3" style="width:100%">
										Второй экземпляр акта направлен с международным почтовым отправлением № <xsl:value-of select="ain:InspectionParticipant/ain:AddresseeMPO"/>
										</td>
									</tr>
									<tr>
										<table>
											<tbody>
												<tr>
													<td align="center" class="graph" style="width:30%">
														<xsl:apply-templates mode="russian_date" select="ain:SecExempDate"/>
														<xsl:if test="ain:SecExempTime">
															<xsl:text> </xsl:text>
															<xsl:apply-templates mode="russian_time" select="ain:SecExempTime"/>
														</xsl:if>
													</td>
													<td>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="graph" style="width:30%">
														<xsl:apply-templates select="ain:ATD_MPOCustomsPerson/cat_ru:PersonName"/> 
												</td>
												</tr>
												<tr>
													<td align="center" class="graphtop" style="width:30%">(дата<xsl:if test="ain:SecExempTime">, время</xsl:if>)<br/>
													</td>
													<td align="center" class="graphtop" style="width:30%"> (подпись)<br/>
													</td>
													<td align="center" class="graphtop" style="width:30%"> (фамилия, инициалы должностного лица)<br/>
													</td>
												</tr>
											</tbody>
										</table>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="ain:InspectionResults/ain:InspGoods">
					<div class="page">
						<table width="100%">
							<tbody>
								<tr>
									<th class="graphMain">Дополнительный лист</th>
								</tr>
								<tr>
									<td align="center">
										<xsl:choose>
											<xsl:when test="ain:ActType='1'">Акт таможенного осмотра</xsl:when>
											<xsl:otherwise>Акт таможенного досмотра</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="ain:ActNumber">
											<xsl:text> № </xsl:text>
											<u>
												<xsl:apply-templates select="ain:ActNumber"/>
											</u>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:for-each select="ain:InspectionResults/ain:InspGoods">
							<xsl:sort select="cat_ru:GoodsNumeric" order="ascending"/>
							<table width="100%">
								<tbody>
									<tr>
										<th class="graphMain">
										Товар № <xsl:value-of select="cat_ru:GoodsNumeric"/>
										<xsl:if test="cat_ru:GoodsTNVEDCode">
											<xsl:text> Код ТН ВЭД </xsl:text>
											<xsl:apply-templates select="cat_ru:GoodsTNVEDCode"/>
										</xsl:if>
										</th>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td class="graphMain">Описание:</td>
									</tr>
									<tr>
										<td class="graph" style="word-break: break-all;">
											<xsl:apply-templates select="cat_ru:GoodsDescription"/>
										</td>
									</tr>
								</tbody>
							</table>
							<xsl:if test="ain:GoodShortFormSign">
								<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Признак сокращенной формы: </td>
											<td class="graph underlined" width="50%">
												<xsl:choose>
													<xsl:when test="ain:GoodShortFormSign = 1 or translate(substring(ain:GoodShortFormSign, 1, 1), 't', 'T') = 'T'">да</xsl:when>
													<xsl:otherwise>нет</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="cat_ru:GrossWeightQuantity">
								<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Вес брутто (кг):</td>
											<td class="graph underlined" width="50%">
												<xsl:apply-templates select="cat_ru:GrossWeightQuantity"/>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="cat_ru:NetWeightQuantity">
								<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Вес нетто (кг):</td>
											<td class="graph underlined" width="50%">
												<xsl:apply-templates select="cat_ru:NetWeightQuantity"/>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<!--table width="100%">
								<tbody>
									<tr>
										<td class="graphMain" width="50%">Страна:</td>
										<td class="graph underlined" width="50%">
											<xsl:apply-templates select="ain:CountryCode"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ain:CountryName"/>
											<xsl:text> </xsl:text>
											<xsl:choose>
												<xsl:when test="ain:CountrySrcFlag='1'"> маркировке на товаре</xsl:when>
												<xsl:when test="ain:CountrySrcFlag='2'"> маркировке на упаковке</xsl:when>
												<xsl:when test="ain:CountrySrcFlag='3'"> сведениям из документов</xsl:when>
												<xsl:otherwise>
													 <xsl:apply-templates select="ain:CountrySrcDesc"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</tbody>
							</table-->
							<table width="100%">
								<tbody>
									<tr>
										<td class="graphMain" width="50%">Вес брутто товаров по документам (кг):</td>
										<td class="graph underlined" width="50%">
											<xsl:apply-templates select="ain:DocBruttoWeight"/>
										</td>
									</tr>
								</tbody>
							</table>
							<xsl:if test="ain:FactWeightGood">
								<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Расчет среднего веса товара:</td>
											<td class="graph underlined" width="50%">
												<xsl:apply-templates select="ain:FactWeightGood/ain:AvgBrutto"/>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<table width="100%">
								<tbody>
									<tr>
										<td class="graphMain" width="50%">Повреждения товара:</td>
										<td class="graph underlined" width="50%">
											<xsl:choose>
												<xsl:when test="ain:GoodsDamageFlag='0' or ain:GoodsDamageFlag='f' or ain:GoodsDamageFlag='false'">не поврежден </xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="ain:DamageDesc">
														<xsl:apply-templates select="."/>
													</xsl:for-each> </xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</tbody>
							</table>
							<xsl:if test="ain:GoodsViolationFlag">
								<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Признак выявленных несоответствий относительно имеющихся у инспектора документов:</td>
											<td class="graph underlined" width="50%">
												<xsl:for-each select="ain:GoodsViolationFlag">
													<xsl:if test="position() != 1">, </xsl:if>
													<xsl:choose>
														<xsl:when test=". = 1">по весу нетто</xsl:when>
														<xsl:when test=". = 2">по количеству товаров, в единицах измерения</xsl:when>
														<xsl:when test=". = 3">по описанию</xsl:when>
														<xsl:when test=". = 4">по иным признакам</xsl:when>
													</xsl:choose>
												</xsl:for-each>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="ain:GoodsViolationFlag = 4 and ain:GoodsViolationDesc">
								<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Описание иных  признаков несоответствия:</td>
											<td class="graph underlined" width="50%">
												<xsl:apply-templates select="ain:GoodsViolationDesc"/>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="ain:ExpressWayBill">
								<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Накладная реестра экспресс-грузов:</td>
											<td class="graph underlined" width="50%">
												<xsl:for-each select="ain:ExpressWayBill">
													<xsl:text>№ п/п </xsl:text>
													<xsl:apply-templates select="ain:ObjectOrdinal"/>
													<xsl:if test="ain:HouseWaybill">
														<br/>
														<xsl:text>№ инд. накл. </xsl:text>
														<xsl:apply-templates select="ain:HouseWaybill"/>
													</xsl:if>
													<br/>
													<xsl:text>ID накл. </xsl:text>
													<xsl:apply-templates select="ain:WayBillID"/>
												</xsl:for-each>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<xsl:if test="ain:MPOId">
								<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Сведения о МПО:</td>
											<td class="graph underlined" width="50%">
												<xsl:for-each select="ain:MPOId">
													<xsl:if test="ain:MPO_ID">
														<xsl:text>№ записи </xsl:text>
														<xsl:apply-templates select="ain:MPO_ID"/>
													</xsl:if>
													<xsl:if test="ain:MPO_Number">
														<br/>
														<xsl:text>№ МПО </xsl:text>
														<xsl:apply-templates select="ain:MPO_Number"/>
													</xsl:if>
													<xsl:if test="ain:RecNum">
														<br/>
														<xsl:text>№ МПО в реестре </xsl:text>
														<xsl:apply-templates select="ain:RecNum"/>
													</xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>
							<table width="100%">
									<tbody>
										<tr>
											<td class="graphMain" width="50%">Признак взятия проб и образцов:</td>
											<td class="graph underlined" width="50%">
												<xsl:choose>
													<xsl:when test="ain:GoodsTestFlag='0'">пробы и образцы товара не отбирались</xsl:when>
													<xsl:when test="ain:GoodsTestFlag='1'">пробы и образцы товара отбирались</xsl:when>
												</xsl:choose>
											</td>
										</tr>
									</tbody>
								</table>
								<xsl:if test="ain:IDKViolation">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain" width="50%">Признак нахождения товара в части грузового отсека, помеченного оператором ИДК как возможное местонахождение незаявленного товара:</td>
												<td class="graph underlined" width="50%">
													<xsl:choose>
														<xsl:when test="ain:IDKViolation = 1 or translate(substring(ain:IDKViolation, 1, 1), 't', 'T') = 'T'">да</xsl:when>
														<xsl:otherwise>нет</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:GoodsNumericDT">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain" width="50%">Номер товара по ДТ:</td>
												<td class="graph underlined" width="50%">
													<xsl:apply-templates select="ain:GoodsNumericDT"/>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:SupplementaryQuantity">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain" width="50%">Количество товаров в  единице измерения, отличной от кг:</td>
												<td class="graph underlined" width="50%">
													<xsl:apply-templates select="ain:SupplementaryQuantity"/>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:CargoInfo">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain" width="50%">Сведения о виде груза:</td>
												<td class="graph underlined" width="50%">
													<xsl:for-each select="ain:CargoInfo">
														<xsl:if test="position() != 1"><br/><br/></xsl:if>
														<xsl:apply-templates mode="addPage" select="."/>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:PlaceInfo">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain" width="50%">Сведения о таре:</td>
												<td class="graph underlined" width="50%">
													<xsl:for-each select="ain:PlaceInfo">
														<xsl:if test="position() != 1"><br/><br/></xsl:if>
														<xsl:apply-templates mode="addPage" select="."/>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:PalleteInfo">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain" width="50%">Сведения о поддонах / палетах:</td>
												<td class="graph underlined" width="50%">
													<xsl:for-each select="ain:PalleteInfo">
														<xsl:if test="position() != 1"><br/><br/></xsl:if>
														<xsl:apply-templates mode="addPage" select="."/>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:PackageInfo">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain" width="50%">Сведения об упаковке:</td>
												<td class="graph underlined" width="50%">
													<xsl:for-each select="ain:PackageInfo">
														<xsl:if test="position() != 1"><br/><br/></xsl:if>
														<xsl:apply-templates mode="addPage" select="."/>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:BillDoc">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain" width="50%">Товаросопроводительный документ:</td>
												<td class="graph underlined" width="50%">
													<xsl:for-each select="ain:BillDoc">
														<xsl:apply-templates select="cat_ru:PrDocumentName"/>
														<xsl:if test="cat_ru:PrDocumentNumber">
															<xsl:text> № </xsl:text>
															<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
														</xsl:if>
														<xsl:if test="cat_ru:PrDocumentDate">
															<xsl:text> от </xsl:text>
															<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
														</xsl:if>
													</xsl:for-each>
												</td>
											</tr>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:CIMList">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain">Сведения о контрольно-идентификационных знаках</td>
											</tr>
										</tbody>
									</table>
									<table width="100%" style="border-collapse: collapse;">
										<tbody>
											<tr class="graph">
												<th style="border:1px solid;">№ знака</th>
												<th style="border:1px solid;">Визуальный номер КИЗ</th>
												<th style="border:1px solid;">RFID</th>
												<th style="border:1px solid;">GTIN</th>
											</tr>
											<xsl:for-each select="ain:CIMList">
												<tr class="graph">
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:Number"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:VisualIdentifierCIM"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:RFID_TID"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:GTINIdentifier"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:GoodsGroupInformation">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain">Информация о группе</td>
											</tr>
										</tbody>
									</table>
									<table width="100%" style="border-collapse: collapse;">
										<tbody>
											<tr class="graph">
												<th style="border:1px solid;">Код источника</th>
												<th style="border:1px solid;">Страна</th>
												<th style="border:1px solid;">Производитель</th>
												<th style="border:1px solid;">Товарный знак</th>
												<th style="border:1px solid;">Место происх.</th>
												<th style="border:1px solid;">Марка</th>
												<th style="border:1px solid;">Модель</th>
												<th style="border:1px solid;">Артикул</th>
												<th style="border:1px solid;">Кол-во</th>
											</tr>
											<xsl:for-each select="ain:GoodsGroupInformation">
												<tr class="graph">
													<td style="border:1px solid;">
														<xsl:choose>
															<xsl:when test="ain:CountrySrcFlag = 1">Маркировка на товаре</xsl:when>
															<xsl:when test="ain:CountrySrcFlag = 2">Маркировка на упаковке</xsl:when>
															<xsl:when test="ain:CountrySrcFlag = 3">Сведения из документов</xsl:when>
															<xsl:when test="ain:CountrySrcFlag = 4">Иное</xsl:when>
														</xsl:choose>
													</td>
													<td style="border:1px solid;">
														<xsl:for-each select="ain:CountryCode | ain:CountryName | ain:CountrySrcDesc">
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="."/>
														</xsl:for-each>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:Manufacturer"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:TradeMark"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:ProductionPlaceName"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:GoodsMark"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:GoodsModel"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:GoodsMarking"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="ain:GoodsGroupQuantity" mode="quantity"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</xsl:if>
								<xsl:if test="ain:IPObjectRegistryNum">
									<table width="100%">
										<tbody>
											<tr>
												<td class="graphMain">Объекты интеллектуальной собственности</td>
											</tr>
										</tbody>
									</table>
									<table width="100%" style="border-collapse: collapse;">
										<tbody>
											<tr class="graph">
												<th style="border:1px solid;">Тип реестра ОИС</th>
												<th style="border:1px solid;">Страна</th>
												<th style="border:1px solid;">Номер</th>
											</tr>
											<xsl:for-each select="ain:IPObjectRegistryNum">
												<tr class="graph">
													<td style="border:1px solid;">
														<xsl:choose>
															<xsl:when test="catESAD_cu:DocumentModeCode = 1">единый таможенный реестр объектов интеллектуальной собственности государств - членов Евразийского экономического союза</xsl:when>
															<xsl:when test="catESAD_cu:DocumentModeCode = 2">национальный таможенный реестр объектов интеллектуальной  собственности</xsl:when>
														</xsl:choose>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="catESAD_cu:CountryCode"/>
													</td>
													<td style="border:1px solid;">
														<xsl:apply-templates select="catESAD_cu:IPORegistryNumber"/>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</xsl:if>
							<br/>
						</xsl:for-each>
					</div>
				</xsl:if>
				<!--xsl:if test="ain:InspectionResults/ain:InspGoods/ain:CIMList">
					<div class="page">
						<table width="100%">
							<tbody>
								<tr>
									<th>Сведения о контрольно-идентификационных знаках</th>
								</tr>
							</tbody>
						</table>
						<table width="100%" style="border-collapse: collapse;">
							<tbody>
								<tr>
									<th style="border:1px solid;">№ знака</th>
									<th style="border:1px solid;">Визуальный номер КИЗ</th>
									<th style="border:1px solid;">RFID</th>
									<th style="border:1px solid;">GTIN</th>
								</tr>
								<xsl:for-each select="ain:InspectionResults/ain:InspGoods[ain:CIMList]">
									<tr>
										<td style="border:1px solid;" colspan="4">Номер товара: <xsl:value-of select="cat_ru:GoodsNumeric"/></td>
									</tr>
									<xsl:for-each select="ain:CIMList">
										<tr>
											<td style="border:1px solid;">
												<xsl:value-of select="ain:Number"/>
											</td>
											<td style="border:1px solid;">
												<xsl:value-of select="ain:VisualIdentifierCIM"/>
											</td>
											<td style="border:1px solid;">
												<xsl:value-of select="ain:RFID_TID"/>
											</td>
											<td style="border:1px solid;">
												<xsl:value-of select="ain:GTINIdentifier"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				</xsl:if-->
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="FIO_inits">
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PersonName']" mode="initials"/>
		<xsl:apply-templates select="*[local-name() = 'PersonMiddleName']" mode="initials"/>
	</xsl:template>
	
	<xsl:template match="*" mode="initials">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="substring(.,1,1)"/>
			<xsl:text>.</xsl:text>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="quantity">
		<xsl:apply-templates select="catESAD_cu:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierName"/>
		<xsl:if test="catESAD_cu:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="catESAD_cu:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="ain:DTNum">
		<xsl:apply-templates select="ain:DTRegNum"/>
		<xsl:apply-templates select="ain:ReestrNum"/>
		<xsl:apply-templates select="ain:OtherDoc"/>
	</xsl:template>

	<xsl:template match="ain:Address">
		<xsl:for-each select="*">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>	
	   
   <xsl:template match="ain:DTRegNum">
	   <xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:if test="ain:AddNumber">
		   <xsl:choose>
				<xsl:when test="ain:AddNumber = 'ЗВ'">В</xsl:when>
				<xsl:otherwise><xsl:apply-templates select="ain:AddNumber"/></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
   </xsl:template>
   
	<xsl:template match="ain:ReestrNum">
		<xsl:apply-templates select="ain:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="russian_date_gtd" select="ain:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="ain:ReestrNumber"/>
		<xsl:if test="ain:MPO_Number">
			<xsl:text> номер МПО </xsl:text>
			<xsl:apply-templates select="ain:MPO_Number"/>
		</xsl:if>
		<xsl:if test="ain:HouseWaybill">
			<xsl:text>, номер индивидуальной накладной </xsl:text>
			<xsl:apply-templates select="ain:HouseWaybill"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="ain:OtherDoc">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="card">
		<xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RBIdentificationNumber"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="russian_date" select="RUScat_ru:IdentityCardDate"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph">(</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:Address/cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
		<xsl:apply-templates select="cat_ru:Address/cat_ru:CountryCode"/>,
        <xsl:if test="cat_ru:Address/cat_ru:Region">
			<xsl:apply-templates select="cat_ru:Address/cat_ru:Region"/>,
        </xsl:if>
		<xsl:if test="cat_ru:Address/cat_ru:City">
			<xsl:apply-templates select="cat_ru:Address/cat_ru:City"/>,
        </xsl:if>
		<xsl:apply-templates select="cat_ru:Address/cat_ru:StreetHouse"/>
		<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
			<xsl:text> </xsl:text>
			<xsl:text>№ </xsl:text>
			<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</xsl:if>
			<xsl:text> </xsl:text>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="spaceSeparated" select="RUScat_ru:IdentityCard"/>
	</xsl:template>
	<xsl:template match="*" mode="org2">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph">(</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:Address/cat_ru:PostalCode">
			<xsl:apply-templates select="cat_ru:Address/cat_ru:PostalCode"/>,
        </xsl:if>
		<xsl:apply-templates select="cat_ru:Address/cat_ru:CountryCode"/>,
        <xsl:if test="cat_ru:Address/cat_ru:Region">
			<xsl:apply-templates select="cat_ru:Address/cat_ru:Region"/>,
        </xsl:if>
		<xsl:if test="cat_ru:Address/cat_ru:City">
			<xsl:apply-templates select="cat_ru:Address/cat_ru:City"/>,
        </xsl:if>
		<xsl:apply-templates select="cat_ru:Address/cat_ru:StreetHouse"/>
	</xsl:template>
	<xsl:template match="*" mode="org3">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<span class="graph">(</span>
			<xsl:apply-templates select="cat_ru:ShortName"/>
			<span class="graph">)</span>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures" mode="RFFeatures"/>
		<xsl:if test="cat_ru:Address">
			<xsl:text> Адрес: </xsl:text>
			<xsl:apply-templates mode="spaceSeparated" select="cat_ru:Address/*"/>
		</xsl:if>
		<xsl:if test="ain:PhysicalPersonIdCard">
			<xsl:text> Документ: </xsl:text>
			<xsl:apply-templates mode="spaceSeparated" select="ain:PhysicalPersonIdCard/*[local-name() = 'IdentityCardName' or local-name() = 'IdentityCardSeries' or local-name() = 'IdentityCardNumber']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="spaceSeparated">
		<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="RFFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:apply-templates select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:apply-templates select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:apply-templates select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="ain:InspectionPlace/ain:InspAddress">
		<tr>
			<td class="graph" colspan="3">
				<span class="graph"> Адрес места досмотра</span>
				<xsl:text> </xsl:text>
				<xsl:for-each select="*">
					<xsl:if test="position() > 1">
						<xsl:text>, </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ain:VOIActNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="ain:InspTransport/ain:InspTransportMean">
		<xsl:for-each select="ain:TransportMeans">
			<xsl:if test="cat_ru:TransportKindCode"><xsl:apply-templates select="cat_ru:TransportKindCode"/>, </xsl:if>
			<xsl:if test="cat_ru:TransportIdentifier"><xsl:apply-templates select="cat_ru:TransportIdentifier"/> </xsl:if>
			<xsl:if test="cat_ru:TransportMeansNationalityCode"> <xsl:apply-templates select="cat_ru:TransportMeansNationalityCode"/></xsl:if>
			<xsl:if test="ain:TransportModeCode">(<xsl:apply-templates select="ain:TransportModeCode"/>)</xsl:if>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ain:InspTransport/ain:ContainerInfo">
		<xsl:if test="ain:ContainerQuantity">
			<xsl:apply-templates select="ain:ContainerQuantity"/>:&#160;</xsl:if>
		<xsl:for-each select="ain:ContainerIdentificator">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="ain:SupplementaryQuantity">
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
	</xsl:template>
	
	<xsl:template match="ain:CargoInfo | ain:PlaceInfo | ain:PalleteInfo | ain:PackageInfo" mode="addPage">
		<xsl:if test="catESAD_cu:InfoKindCode">
			<xsl:choose>
				<xsl:when test="catESAD_cu:InfoKindCode='0'">упаковка</xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='1'">тара</xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='2'">груз</xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='3'">поддон</xsl:when>
				<xsl:when test="catESAD_cu:InfoKindCode='4'">индивидуальная упаковка</xsl:when>
			</xsl:choose>
			<xsl:text>; </xsl:text>
		</xsl:if>
		<xsl:if test="catESAD_cu:PalleteCode">
			<xsl:text>код: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:PalleteCode"/>
			<xsl:text>; </xsl:text>
		</xsl:if>
		<xsl:if test="catESAD_cu:PalleteQuantity">
			<xsl:text>кол-во: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:PalleteQuantity"/>
			<xsl:text>; </xsl:text>
		</xsl:if>
		<xsl:if test="catESAD_cu:CargoDescriptionText">
			<xsl:text>описание: </xsl:text>
			<xsl:apply-templates select="catESAD_cu:CargoDescriptionText"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:InfoKindCode | catESAD_cu:PalleteCode | catESAD_cu:PalleteQuantity | catESAD_cu:CargoDescriptionText">
			<br/>
		</xsl:if>
		<xsl:text>Признак наличия повреждений товаров и упаковки: </xsl:text>
		<xsl:choose>
			<xsl:when test="ain:PackDestructFlag='0'">нет</xsl:when>
			<xsl:when test="ain:PackDestructFlag='1'">есть</xsl:when>
		</xsl:choose>
		<xsl:if test="ain:PackageDescription">
			<br/>
			<xsl:text>Описание упаковки: </xsl:text>
			<xsl:apply-templates select="ain:PackageDescription"/>
		</xsl:if>
		<xsl:if test="ain:PackDestructDesc">
			<br/>
			<xsl:text>Описание повреждений упаковки: </xsl:text>
			<xsl:apply-templates select="ain:PackDestructDesc"/>
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template match="ain:CargoInfo | ain:PlaceInfo | ain:PalleteInfo | ain:PackageInfo">
	Вид <xsl:apply-templates select="catESAD_cu:PackingCode"/>
		<xsl:if test="catESAD_cu:PakingQuantity">, количество <xsl:apply-templates select="catESAD_cu:PakingQuantity"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:PakingQuantity">, описание <xsl:for-each select="ain:PackageDescription">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="ain:PackDestructFlag='0' or ain:PackDestructFlag='f' or ain:PackDestructFlag='false'"> повреждений нет</xsl:when>
			<xsl:otherwise> повреждения есть<xsl:for-each select="ain:PackDestructDesc">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="ain:InspGoods">
		<xsl:for-each select="cat_ru:GoodsDescription">
			<xsl:apply-templates select="."/> 
												</xsl:for-each>
		<xsl:choose>
			<xsl:when test="ain:GoodsDamageFlag='0' or ain:GoodsDamageFlag='f' or ain:GoodsDamageFlag='false'">не поврежден </xsl:when>
			<xsl:otherwise>поврежден: <xsl:for-each select="ain:DamageDesc">
					<xsl:apply-templates select="."/>
				</xsl:for-each> </xsl:otherwise>
		</xsl:choose>
		<xsl:if test="ain:CountryCode or ain:CountryName">
													Страна - изготовитель <xsl:apply-templates select="ain:CountryCode"/> <xsl:apply-templates select="ain:CountryName"/> 
												</xsl:if>
												Сведения о стране изготовления согласно<xsl:choose>
			<xsl:when test="ain:CountrySrcFlag='1'"> маркировке на товаре</xsl:when>
			<xsl:when test="ain:CountrySrcFlag='2'"> маркировке на упаковке</xsl:when>
			<xsl:when test="ain:CountrySrcFlag='3'"> сведениям из документов</xsl:when>
			<xsl:otherwise>
														 <xsl:apply-templates select="ain:CountrySrcDesc"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="ain:SupplementaryQuantity">
													Количество <xsl:apply-templates select="ain:SupplementaryQuantity"/>
		</xsl:if>
		<xsl:if test="cat_ru:GrossWeightQuantity"> Вес брутто <xsl:apply-templates select="cat_ru:GrossWeightQuantity"/>
		</xsl:if>
		<xsl:if test="cat_ru:NetWeightQuantity"> Вес нетто <xsl:apply-templates select="cat_ru:NetWeightQuantity"/>
		</xsl:if>
		<xsl:if test="ain:CargoInfo">
												, Сведения о виде груза <xsl:apply-templates select="ain:CargoInfo"/>
		</xsl:if>
		<xsl:if test="ain:PlaceInfo">
												, Сведения о таре (потребительской / индивидуальной) <xsl:apply-templates select="ain:PlaceInfo"/>
		</xsl:if>
		<xsl:if test="ain:PalleteInfo">
												, Сведения о поддонах / палетах <xsl:apply-templates select="ain:PalleteInfo"/>
		</xsl:if>
		<xsl:if test="ain:PackageInfo">
												, Cведения об упаковкe <xsl:apply-templates select="ain:PackageInfo"/>
		</xsl:if>
		<xsl:if test="ain:BillDoc">
			<xsl:text>, Сопроводительный документ </xsl:text>
			<xsl:for-each select="ain:BillDoc/*">
				<xsl:choose>
					<xsl:when test="contains(local-name(.),'Date')">
						<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
					</xsl:when>
					<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
				</xsl:choose>
				<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
			</xsl:for-each>
		</xsl:if>;	
	</xsl:template>
		<!-- Шаблон для типа cat_ru:GTDID6Type -->
	<xsl:template match="ain:ActNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:SerialNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="doc">
		<xsl:apply-templates select="*[local-name() = 'PrDocumentName']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="russian_date"/>
		<xsl:if test="*[local-name() = 'DocumentModeCode']">
			<xsl:choose>
				<xsl:when test="*[local-name() = 'DocumentModeCode'] = '1'"> лицензия </xsl:when>
				<xsl:when test="*[local-name() = 'DocumentModeCode'] = '2'"> свидетельство </xsl:when>
			</xsl:choose>
		</xsl:if>
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
	<xsl:template name="russian_date_gtd">
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
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ActInspection']//*" priority="-1">
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
	<xsl:template match="*" mode="breakingComma">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:variable name="tempVal">
				<xsl:call-template name="Replace">
					<xsl:with-param name="string" select="."/>
					<xsl:with-param name="target" select="','"/>
					<xsl:with-param name="value" select="'$%$'"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:call-template name="Replace">
				<xsl:with-param name="string" select="$tempVal"/>
				<xsl:with-param name="target" select="'$%$'"/>
				<xsl:with-param name="value" select="', '"/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="Replace">
		<xsl:param name="string"/>
		<xsl:param name="target"/>
		<xsl:param name="value"/>
		<xsl:choose>
		  <xsl:when test="contains( $string, $target)">
			<xsl:call-template name="Replace">
			  <xsl:with-param name="string" select="concat(substring-before($string, $target), $value, substring-after($string, $target))"/>
			  <xsl:with-param name="target" select="$target"/>
			  <xsl:with-param name="value" select="$value"/>
			</xsl:call-template>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:value-of select="$string"/>
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
