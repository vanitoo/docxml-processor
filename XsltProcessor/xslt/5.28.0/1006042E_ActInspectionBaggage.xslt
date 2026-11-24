<?xml version="1.0" encoding="utf-8"?>
<!-- Решение комиссии таможенного союза Евразийского экономического сообщества от 20.05.2010 г. № 260 "О формах таможенных документов". 
- Акт таможенного досмотра (таможенного осмотра) товаров, перемещаемых через таможенную границу Евразийского экономического союза физическими лицами для личного пользования в сопровождаемом багаже. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.28.0" xmlns:aib="urn:customs.ru:Information:CustomsDocuments:ActInspectionBaggage:5.28.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- Шаблон для типа ActInspectionBaggageType -->
	<xsl:template match="aib:ActInspectionBaggage">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
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
		
						.graphMaib {
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
				<div class="page">
					<table cellpadding="0" cellspacing="0" style="width:100%">
						<tbody>
							<tr>
								<td align="center" class="graphMaib" style="width:100%">
									<xsl:if test="aib:Customs/cat_ru:Code">
										<xsl:apply-templates select="aib:Customs/cat_ru:Code"/>, </xsl:if>
									<xsl:apply-templates select="aib:Customs/cat_ru:OfficeName"/>
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
									<xsl:when test="aib:ActType='1'">
										<td align="center" class="graphMaib" style="width:100%">АКТ ТАМОЖЕННОГО ОСМОТРА<br/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="center" class="graphMaib" style="width:100%">АКТ ТАМОЖЕННОГО ДОСМОТРА<br/>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<tr>
								<td align="center" class="graphMaib" style="width:100%">
									<xsl:text>товаров, перемещаемых через таможенную границу Евразийского экономического союза физическими лицами для личного пользования в сопровождаемом багаже</xsl:text><br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph" style="width:100%">№<xsl:apply-templates select="aib:ActNumber"/>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="right" class="" style="width:100%">
									<!--span class="underlined"><xsl:value-of select="aib:ActSheetNumber"/></span>листов
							<br/-->
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									Начат: 
									<xsl:value-of select="substring(aib:BeginInspection, 12, 2)"/>
									<xsl:text> час. </xsl:text>
									<xsl:value-of select="substring(aib:BeginInspection, 15, 2)"/>
									<xsl:text> мин. </xsl:text>
									<xsl:apply-templates mode="russian_date" select="aib:BeginInspection"/>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%"> Настоящий акт составлен о том, что должностным (должностными) лицом (лицами):<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph" style="width:100%">
									<xsl:for-each select="aib:ATDCustomsPerson">
										<xsl:if test="catESAD_ru:OfficialStatus = '1'">
											<xsl:apply-templates select="cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
										</xsl:if>
										<xsl:if test="catESAD_ru:OfficialStatus = '2'">
											<xsl:apply-templates select="cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
											<xsl:text> </xsl:text>
											<xsl:if test="catESAD_ru:OTOFlag = '1'">(должностное лицо, не являющееся должностным лицом таможенного поста (ОТОиТК)) </xsl:if> 
											<xsl:if test="catESAD_ru:OTOFlag = '2'">(уполномоченное должностное лицо таможенного поста (ОТОиТК)) </xsl:if>
											<xsl:if test="catESAD_ru:LawAct">
												<xsl:apply-templates select="catESAD_ru:LawAct"/>
												<xsl:text> </xsl:text>
											</xsl:if>
											<!--xsl:if test="catESAD_ru:SignatureFlag = 'false'">АТД не подписано</xsl:if>&#160;<xsl:if test="catESAD_ru:SignatureFlag = 'true'">АТД подписано</xsl:if-->
											<xsl:apply-templates select="catESAD_ru:LNP"/> 
											<xsl:apply-templates select="catESAD_ru:CustomsCode"/>
										</xsl:if>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphtop" style="width:100%">(должность, фамилии, инициалы должностных лиц таможенного органа, проводивших <xsl:if test="aib:ActType='1'">таможенный осмотр</xsl:if><xsl:if test="not(aib:ActType='1')">таможенный досмотр</xsl:if>)</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									В присутствии
									<xsl:choose>
										<xsl:when test="aib:InspectionParticipant/aib:Status='2'">
декларанта, лица, обладающего полномочиями в отношении товаров (транспортных средств), либо их представителей:<br/>
										</xsl:when>
										<xsl:when test="not(aib:InspectionParticipant/aib:Status='2')">
											<s>декларанта, лица, обладающего полномочиями в отношении товаров (транспортных средств), либо их представителей</s>:<br/>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<xsl:if test="aib:InspectionParticipant/aib:Status='2'">
								<tr>
									<td class="graph" style="width:100%">
										<br/>
										<!--xsl:if test="(aib:InspectionParticipant/aib:Status !='понятой') and (substring(aib:InspectionParticipant/aib:Status, 1,10) !='специалист')"-->
										<xsl:for-each select="aib:InspectionParticipant">
											<xsl:if test="aib:Status='2'">
												декларант (иное лицо, уполномоченное в отношении товаров)<xsl:if test="aib:Job"> Место работы <xsl:apply-templates select="aib:Job"/>,</xsl:if>
												<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
												<xsl:if test="cat_ru:PersonSurname"> <xsl:apply-templates select="cat_ru:PersonSurname"/></xsl:if>
												<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
												<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
												<xsl:if test="aib:ParticipantDocs"> <xsl:apply-templates mode="card" select="aib:ParticipantDocs"/></xsl:if>
												<xsl:if test="aib:Address"> Место жительства <xsl:apply-templates select="aib:Address"/></xsl:if>
												<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:if>
										</xsl:for-each>
										<!--/xsl:if-->
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									<br/>[ <xsl:choose>
										<xsl:when test="aib:ActType=0">
											<span class="graphBold">х</span>
										</xsl:when>
										<xsl:when test="aib:ActType!=0">
											<span class="graphBold">–</span>
										</xsl:when>
									</xsl:choose> ] – проведен таможенный досмотр</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									<br/>[ <xsl:choose>
										<xsl:when test="aib:ActType=1">
											<span class="graphBold">х</span>
										</xsl:when>
										<xsl:when test="aib:ActType!=1">
											<span class="graphBold">–</span>
										</xsl:when>
									</xsl:choose> ] – проведен таможенный осмотр</td>
							</tr>
							<xsl:if test="aib:UseTMCC">
								<tr>
									<td class="graph" style="width:100%">
										(с применением технических средств таможенного контроля:
										<!--<xsl:for-each select="aib:UseTMCC"><xsl:value-of select="."/>&#160;</xsl:for-each>-->
										<xsl:for-each select="aib:UseTMCC">
											<xsl:apply-templates select="aib:TSTKCode"/>
											<xsl:if test="aib:TSTK"> - <xsl:apply-templates select="aib:TSTK"/>
											</xsl:if>
											<xsl:if test="aib:Comments"> - <xsl:apply-templates select="aib:Comments"/>
											</xsl:if>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>)
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="graph" style="width:100%">
									<br/>товаров, перемещаемых гражданином(кой):</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									<br/>
									<xsl:for-each select="aib:InspectionParticipant[aib:Status='1']">
										лицо, перемещающее товары <xsl:if test="aib:Job"> Место работы <xsl:apply-templates select="aib:Job"/>,</xsl:if>
										<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
										<xsl:if test="cat_ru:PersonSurname"> <xsl:apply-templates select="cat_ru:PersonSurname"/></xsl:if>
										<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
										<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
										<xsl:if test="aib:ParticipantDocs"> <xsl:apply-templates mode="card" select="aib:ParticipantDocs"/></xsl:if>
										<xsl:if test="aib:Address"> Место жительства <xsl:apply-templates select="aib:Address"/></xsl:if>
										<xsl:if test="position()!=last()"><br/></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									<br/>
									<xsl:if test="aib:Direction='2'">прибывшим(ей) из: 
										<xsl:value-of select="aib:DepartCountry/RUScat_ru:CountryCode"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="aib:DepartCountry/RUScat_ru:CountryName"/>
										<xsl:text>, </xsl:text>
									</xsl:if>
									<xsl:if test="aib:Direction='1'">убывающего(ей) в: 
										<xsl:value-of select="aib:DestinCountry/RUScat_ru:CountryCode"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="aib:DestinCountry/RUScat_ru:CountryName"/>
										<xsl:text>, </xsl:text>
									</xsl:if>
									код ТС - <xsl:value-of select="aib:TransportModeCode"/>
									<xsl:if test="aib:VoyageNumber">
										<xsl:variable name="transportNumber">
											<xsl:choose>
												<xsl:when test="aib:TransportModeCode = 10 or aib:TransportModeCode = 80">номер судна</xsl:when>
												<xsl:when test="aib:TransportModeCode = 20">номер поезда</xsl:when>
												<xsl:when test="aib:TransportModeCode = 30 or aib:TransportModeCode = 31 or aib:TransportModeCode = 32 or aib:TransportModeCode = 71 or aib:TransportModeCode = 72 or aib:TransportModeCode = 90 or aib:TransportModeCode = 99">регистрационный номер</xsl:when>
												<xsl:when test="aib:TransportModeCode = 40">номер рейса</xsl:when>
												<xsl:when test="aib:TransportModeCode = 50">номер почтового отправления</xsl:when>
												<xsl:otherwise>номер рейса</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<xsl:text>, </xsl:text><xsl:value-of select="$transportNumber"/><xsl:text> - </xsl:text><xsl:value-of select="aib:VoyageNumber"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphtop" style="width:100%">(страна, вид транспорта, номер рейса)<br/>
								</td>
							</tr>
							<xsl:if test="aib:InspectionParticipant[aib:Status='4']">
								<tr>
									<td class="graph" style="width:100%">
										<br/>понятых (на основании пункта 7 статьи 328 Таможенного кодекса Евразийского экономического союза):<br/>
										<xsl:for-each select="aib:InspectionParticipant[aib:Status='4']">
											понятой<xsl:if test="aib:Job"> Место работы <xsl:apply-templates select="aib:Job"/>,</xsl:if>
											<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
											<xsl:if test="cat_ru:PersonSurname"> <xsl:apply-templates select="cat_ru:PersonSurname"/></xsl:if>
											<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
											<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
											<xsl:if test="aib:ParticipantDocs"> <xsl:apply-templates mode="card" select="aib:ParticipantDocs"/></xsl:if>
											<xsl:if test="aib:Address"> Место жительства <xsl:apply-templates select="aib:Address"/></xsl:if>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="aib:InspectionParticipant[aib:Status='3']">
								<tr>
									<td class="graph" style="width:100%">
										<br/>с участием специалиста (эксперта):<br/>
										<xsl:for-each select="aib:InspectionParticipant[aib:Status='3']">
											специалист<xsl:if test="aib:Job"> Место работы <xsl:apply-templates select="aib:Job"/>,</xsl:if>
											<xsl:if test="cat_ru:PersonPost"> <xsl:apply-templates select="cat_ru:PersonPost"/></xsl:if>
											<xsl:if test="cat_ru:PersonSurname"> <xsl:apply-templates select="cat_ru:PersonSurname"/></xsl:if>
											<xsl:if test="cat_ru:PersonName"> <xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>.</xsl:if>
											<xsl:if test="cat_ru:PersonMiddleName"> <xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>.</xsl:if>
											<xsl:if test="aib:ParticipantDocs"> <xsl:apply-templates mode="card" select="aib:ParticipantDocs"/></xsl:if>
											<xsl:if test="aib:Address"> Место жительства <xsl:apply-templates select="aib:Address"/></xsl:if>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphtop" style="width:100%">(место работы, должность, фамилия, инициалы, наименование и номер документа, удостоверяющего личность, место жительства)<br/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="graph" style="width:100%">
									<br/>[ <xsl:choose>
										<xsl:when test="aib:FlagDeclarantAbsence='0' or aib:FlagDeclarantAbsence = 'false' or aib:FlagDeclarantAbsence = 'f'">
											<span class="graphBold">х</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="graphBold">–</span>
										</xsl:otherwise>
									</xsl:choose> ] Таможенный досмотр проведен в отсутствие декларанта или иного лица, обладающего полномочиями в отношении товаров (их представителей) по причине:<xsl:value-of select="aib:Reason/aib:ReasonText"/>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									<br/>Место проведения таможенного <xsl:choose>
										<xsl:when test="aib:ActType='1'">осмотра</xsl:when>
										<xsl:otherwise>досмотра</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									<br/>
									<xsl:apply-templates select="aib:InspectionPlace"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphtop" style="width:100%">(зона таможенного контроля, помещение, каюта, купе, салон автомобиля и т.д.)<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%"><br/>В результате таможенного <xsl:choose>
										<xsl:when test="aib:ActType='1'">осмотра</xsl:when>
										<xsl:otherwise>досмотра</xsl:otherwise>
									</xsl:choose> установлено следующее:
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									<xsl:text>Предъявлен багаж из </xsl:text>
									<xsl:choose>
										<xsl:when test="aib:InspectionResults/aib:LuggagePlace">
											<u><xsl:value-of select="aib:InspectionResults/aib:LuggagePlace"/></u>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>____</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text> мест. Вес брутто </xsl:text>
									<xsl:choose>
										<xsl:when test="(aib:InspectionResults/aib:LuggageBruttoWeight) and (aib:InspectionResults/aib:LuggageBruttoWeight !='0')">
											<u><xsl:apply-templates select="aib:InspectionResults/aib:LuggageBruttoWeight"/></u>
										</xsl:when>
										<xsl:otherwise>____</xsl:otherwise>
									</xsl:choose>
									<xsl:text> кг.</xsl:text></td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									<xsl:apply-templates select="aib:InspectionResults/aib:TextAct"/>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									К акту прилагаются: 
									<xsl:if test="aib:ApplicMarks or aib:FixInfo">
										<br/>
										<xsl:apply-templates select="aib:ApplicMarks"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="aib:FixInfo"/>
										<xsl:if test="aib:PhotoQuantity">
											, а также фотографии в количестве <xsl:apply-templates select="aib:PhotoQuantity"/> шт.
										</xsl:if>
									</xsl:if>
									<xsl:if test="not(aib:ApplicMarks) and not(aib:FixInfo) and aib:PhotoQuantity">
										<br/>
										Фотографии в количестве <xsl:apply-templates select="aib:PhotoQuantity"/> шт.
									</xsl:if>
									<xsl:if test="aib:BillDoc">
										<br/>
										Платежные документы, подтвеждающие приобретение и стоимость товаров:
										<xsl:for-each select="aib:BillDoc">
											<br/>
											<xsl:apply-templates select="cat_ru:PrDocumentName"/>
											<xsl:if test="cat_ru:PrDocumentNumber">
												<xsl:text> № </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
											</xsl:if>
											<xsl:if test="cat_ru:PrDocumentDate">
												<xsl:text> от </xsl:text>
												<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphtop" style="width:100%">(фото (видеоматериалы), пояснение лица, имеющего отношение к перемещению товаров, документы (чеки, счета), подтверждающие приобретение и стоимость товаров и т.д.)<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:100%">
									Лицо (лица), проводившее (проводившие) таможенный 
									<xsl:choose>
										<xsl:when test="aib:ActType='1'">осмотр</xsl:when>
										<xsl:otherwise>досмотр</xsl:otherwise>
									</xsl:choose>:
								</td>
							</tr>
							<xsl:for-each select="aib:ATDCustomsPerson[translate(substring(*[local-name() = 'SignatureFlag'], 1, 1), 't', 'T') = 'T' or *[local-name() = 'SignatureFlag'] = 1]">
								<tr>
									<td class="graph" style="width:100%">
										<xsl:apply-templates select="cat_ru:PersonPost"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="catESAD_ru:LNP"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="catESAD_ru:CustomsCode"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
										<xsl:text>. </xsl:text>
										<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
										<xsl:text>. </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphtop" style="width:100%">
										(должность, подпись, личная номерная печать, инициалы, фамилия)<br/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="aib:InspectionParticipant[aib:Status ='3']">
								<tr>
									<td class="graph" style="width:100%">
										Эксперт (специалист):
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="aib:InspectionParticipant[aib:Status ='3']">
								<tr>
									<td class="graph" style="width:100%">
										<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
										<xsl:text>. </xsl:text>
										<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
										<xsl:text>. </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphtop" style="width:100%">
										(подпись, инициалы, фамилия)<br/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="aib:InspectionParticipant[aib:Status ='2']">
								<tr>
									<td class="graph" style="width:100%">
										Лицо, обладающее полномочиями в отношении товаров:
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="aib:InspectionParticipant[aib:Status ='2']">
								<tr>
									<td class="graph" style="width:100%">
										<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
										<xsl:text>. </xsl:text>
										<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
										<xsl:text>. </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphtop" style="width:100%">
										(подпись, инициалы, фамилия)<br/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="aib:InspectionParticipant[aib:Status !='2' or aib:Status !='3']">
								<tr>
									<td class="graph" style="width:100%">
										Присутствующие лица:
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="aib:InspectionParticipant[aib:Status !='2' or aib:Status !='3']">
								<tr>
									<td class="graph" style="width:100%">
										<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
										<xsl:text>. </xsl:text>
										<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
										<xsl:text>. </xsl:text>
										<xsl:apply-templates select="cat_ru:PersonSurname"/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graphtop" style="width:100%">
										(подпись, инициалы, фамилия)<br/>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="graph" align="center" style="width:100%">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td class="graph" align="center" style="width:100%">
									Окончен: 
									<xsl:value-of select="substring(aib:EndInspection, 12, 2)"/>
									<xsl:text> час. </xsl:text>
									<xsl:value-of select="substring(aib:EndInspection, 15, 2)"/>
									<xsl:text> мин. </xsl:text>
									<xsl:apply-templates mode="russian_date" select="aib:EndInspection"/>
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
													Второй экземпляр акта получен на руки 
												</td>
												<td>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graph" style="width:20%">
													<xsl:for-each select="aib:InspectionParticipant[aib:ATDReceiveCopy='1' or aib:ATDReceiveCopy='t' or aib:ATDReceiveCopy='true']">
														<xsl:if test="position()!=1">, </xsl:if>
														<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
														<xsl:text>. </xsl:text>
														<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
														<xsl:text>. </xsl:text>
														<xsl:apply-templates select="cat_ru:PersonSurname"/>
													</xsl:for-each>
												</td>
												<td align="center" class="graph" style="width:20%">
													<xsl:apply-templates mode="russian_date" select="aib:SecExempDate"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="graph" style="width:40%">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<br/>
												</td>
												<td align="center" class="graphtop" style="width:20%">(подпись)<br/>
												</td>
												<td align="center" class="graphtop" style="width:20%">(инициалы, фамилия)<br/>
												</td>
												<td align="center" class="graphtop" style="width:20%">(дата)<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<xsl:if test="aib:InspectionResults/aib:InspGoods">
					<div class="page">
						<table width="100%">
							<tbody>
								<tr>
									<th class="graphMaib">Дополнительный лист</th>
								</tr>
								<tr>
									<td align="center">
										<xsl:choose>
											<xsl:when test="aib:ActType='1'">к акту таможенного осмотра</xsl:when>
											<xsl:otherwise>к акту таможенного досмотра</xsl:otherwise>
										</xsl:choose>
										товаров, перемещаемых через таможенную границу Евразийского экономического союза физическими лицами для личного пользования в сопровождаемом багаже
										<xsl:if test="aib:ActNumber">
											<br/>
											<xsl:text> № </xsl:text>
											<u>
												<xsl:apply-templates select="aib:ActNumber"/>
											</u>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table width="100%">
							<tbody>
								<tr>
									<td class="graph" style="width:100%"><br/>В результате таможенного <xsl:choose>
											<xsl:when test="aib:ActType='1'">осмотра</xsl:when>
											<xsl:otherwise>досмотра</xsl:otherwise>
										</xsl:choose> установлено следующее:
									</td>
								</tr>
								<tr>
									<td class="graph" style="width:100%">
										<xsl:if test="aib:InspectionResults/aib:InspGoods/aib:GoodsQuantity">
											Количество наименований досматриваемых товаров - 
											<xsl:value-of select="aib:InspectionResults/aib:InspGoods/aib:GoodsQuantity"/>
											<br/>
										</xsl:if>
										Товары, относительно которых выявлено нарушение:
										<br/>
										<xsl:for-each select="aib:InspectionResults/aib:InspGoods/aib:OffenseGoods">
											<xsl:apply-templates select="aib:GoodsDescription"/>
											<xsl:text> - </xsl:text>
											<xsl:choose>
												<xsl:when test="aib:OffenseDescription/aib:OffenseIndicator='1'">количество/вес превышает установленные нормы для беспошлинного ввоза</xsl:when>
												<xsl:when test="aib:OffenseDescription/aib:OffenseIndicator='2'">товар является (может являться) предметом административного нарушения/преступления</xsl:when>
											</xsl:choose>
											<xsl:for-each select="aib:OffenseDescription/aib:LawDocument">
												<xsl:if test="position() != 1">; </xsl:if>
												<xsl:apply-templates select="."/>
											</xsl:for-each>
											<xsl:if test="aib:LuggageDescription"><br/>
												Описание места багажа, его отличительные и идентификационные признаки:
												<xsl:apply-templates select="aib:LuggageDescription"/>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="aib:GoodsDamageFlag='0' or aib:GoodsDamageFlag='f' or aib:GoodsDamageFlag='false'">Товар не поврежден.</xsl:when>
												<xsl:otherwise>
													Товар поврежден: <xsl:apply-templates select="aib:DamageDesc"/>
												</xsl:otherwise>
											</xsl:choose>
											<br/>
											<br/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graph" style="width:100%">
										Должностные лица:
									</td>
								</tr>
								<xsl:for-each select="aib:ATDCustomsPerson[translate(substring(*[local-name() = 'SignatureFlag'], 1, 1), 't', 'T') = 'T' or *[local-name() = 'SignatureFlag'] = 1]">
									<tr>
										<td class="graph" style="width:100%">
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
											<xsl:text>. </xsl:text>
											<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="catESAD_ru:LNP"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="catESAD_ru:CustomsCode"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">
											(подпись, инициалы, фамилия, личная номерная печать)<br/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="aib:InspectionParticipant[aib:Status !='3']">
									<tr>
										<td class="graph" style="width:100%">
											Присутствующие лица:
										</td>
									</tr>
								</xsl:if>
								<xsl:for-each select="aib:InspectionParticipant[aib:Status !='3']">
									<tr>
										<td class="graph" style="width:100%">
											<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
											<xsl:text>. </xsl:text>
											<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">
											(подпись, инициалы, фамилия)<br/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="aib:InspectionParticipant[aib:Status ='3']">
									<tr>
										<td class="graph" style="width:100%">
											Эксперт (специалист):
										</td>
									</tr>
								</xsl:if>
								<xsl:for-each select="aib:InspectionParticipant[aib:Status ='3']">
									<tr>
										<td class="graph" style="width:100%">
											<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
											<xsl:text>. </xsl:text>
											<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
											<xsl:text>. </xsl:text>
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
										</td>
									</tr>
									<tr>
										<td align="center" class="graphtop" style="width:100%">
											(подпись, инициалы, фамилия)<br/>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td class="graph" style="width:40%">
														Второй экземпляр акта получил на руки 
													</td>
													<td>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="graph" style="width:20%">
														<xsl:for-each select="aib:InspectionParticipant[aib:ATDReceiveCopy='1' or aib:ATDReceiveCopy='t' or aib:ATDReceiveCopy='true']">
															<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
															<xsl:text>. </xsl:text>
															<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
															<xsl:text>. </xsl:text>
															<xsl:apply-templates select="cat_ru:PersonSurname"/>
														</xsl:for-each>
													</td>
													<td align="center" class="graph" style="width:20%">
														<xsl:apply-templates mode="russian_date" select="aib:SecExempDate"/>
													</td>
												</tr>
												<tr>
													<td align="center" class="graph" style="width:40%">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<br/>
													</td>
													<td align="center" class="graphtop" style="width:20%">(подпись)<br/>
													</td>
													<td align="center" class="graphtop" style="width:20%">(инициалы, фамилия)<br/>
													</td>
													<td align="center" class="graphtop" style="width:20%">(дата)<br/>
													</td>
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
	
	<xsl:template match="aib:LawDocument">
		<xsl:if test="aib:ClauseNumber">
			<xsl:text> часть </xsl:text>
			<xsl:apply-templates select="aib:ClauseNumber"/>
		</xsl:if>
		<xsl:if test="aib:ArticleNumber">
			<xsl:text> статьи </xsl:text>
			<xsl:apply-templates select="aib:ArticleNumber"/>
			<xsl:if test="aib:PartNumber">
				<xsl:text>.</xsl:text>
				<xsl:apply-templates select="aib:PartNumber"/>
			</xsl:if>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="aib:Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() = 'PostalCode' or local-name() = 'CounryName' or local-name() = 'Region' or local-name() = 'District' or local-name() = 'Town' or local-name() = 'City' or local-name() = 'StreetHouse' or local-name() = 'House' or local-name() = 'Room']">
					<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
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
		<!--xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/-->
	</xsl:template>
	
	<xsl:template match="aib:ActNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
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
	<xsl:template match="//*[local-name()='ActInspectionBaggage']//*" priority="-1">
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
