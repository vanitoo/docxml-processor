<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:vsa="urn:customs.ru:Information:CustomsAuditDocuments:VehicleStopAct:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0">
	<!-- Шаблон для типа VehicleStopActType -->
	<xsl:template match="vsa:VehicleStopAct">
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
                  
                  .inlinetable
					{
					border: 0;
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
					text-align: center;
					}
				.descr{
					font-size: 8pt;
					text-align: center;
					vertical-align:top;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
										<table>
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:for-each select="vsa:Customs">
										<xsl:if test="position()!=1"><xsl:text> (</xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=1"><xsl:text>)</xsl:text></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td class="graphLittle">(наименование таможенного органа)</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Акт<br/>об остановке автомобильного транспортного средства</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="25%" align="left">
									<xsl:apply-templates select="vsa:ActDate" mode="russian_date_month"/>
									<xsl:if test="not(vsa:ActDate)">
										<xsl:call-template name="russian_date_month"/>
									</xsl:if>
								</td>
								<td width="40%" align="right"></td>
								<td width="35%" align="right">
									<table>
										<tbody>
											<tr>
												<td width="10%">№ </td>
												<td width="90%" class="value" align="center">
													<xsl:apply-templates select="vsa:ActRegNumber" mode="regnum"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									1. Дата и время остановки автомобильного транспортного средства: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="vsa:StopDate" mode="russian_date_time"/>
													<br/>
												</td>
											</tr>
											<!--tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(наименование помещения и (или) территории)</xsl:text>
												</td>
											</tr-->
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									2. Должностное лицо таможенного органа, остановившее автомобильное транспортное средство: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="vsa:StoppingOfficial" mode="fio"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="vsa:StoppingOfficial/cat_ru:PersonPost"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(фамилия, инициалы и должность должностного лица таможенного органа)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									3. Место остановки: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="vsa:FactStopPlace/*">
														<xsl:if test="position()!=1">, </xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(район, населенный пункт, учетный номер автодороги)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									4. Регистрационные данные автомобильного транспортного средства: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="vsa:Vehicle">
														<xsl:if test="cat_ru:VIN">
															<xsl:text>VIN: </xsl:text>
															<xsl:apply-templates select="cat_ru:VIN"/>
															<xsl:if test="cat_ru:TransportMarkCode or cat_ru:TransportIdentifier">;</xsl:if>
														</xsl:if>
														<xsl:if test="cat_ru:TransportMarkCode">
															<xsl:text> марка: </xsl:text>
															<xsl:apply-templates select="cat_ru:TransportMarkCode"/>
															<xsl:if test="cat_ru:TransportIdentifier">;</xsl:if>
														</xsl:if>
														<xsl:if test="cat_ru:TransportIdentifier">
															<xsl:text> номер: </xsl:text>
															<xsl:apply-templates select="cat_ru:TransportIdentifier"/>
														</xsl:if>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(марка, государственный регистрационный номер транспортного средства и прицепа)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									5. Товар: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="vsa:Goods">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="cat_ru:GoodsNumeric"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="cat_ru:GoodsDescription"/>
														<xsl:if test="cat_ru:GrossWeightQuantity">
															<xsl:text>, </xsl:text>
															<xsl:apply-templates select="cat_ru:GrossWeightQuantity" mode="translate_number"/>
															<xsl:text> кг.</xsl:text>
														</xsl:if>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(наименование товаров, количество, вес)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									6. Направление перемещения: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:text>страна отправления: </xsl:text>
													<xsl:apply-templates select="vsa:DispatchCountry/*" mode="comma_separated"/>
													<xsl:text>, отправитель: </xsl:text>
													<xsl:apply-templates select="vsa:ConsignorDetails" mode="org"/>
													<xsl:text>, страна назначения: </xsl:text>
													<xsl:apply-templates select="vsa:DestinationCountry/*" mode="comma_separated"/>
													<xsl:text>, получатель: </xsl:text>
													<xsl:apply-templates select="vsa:ConsigneeDetails" mode="org"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(страна отправления, отправитель, страна назначения, получатель)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									7. Документы на товар: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="vsa:PresentedDocuments" mode="doc"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(реквизиты документов, содержащие сведения о товаре)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									8. При проверке документов установлено: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="vsa:DocsCheckResults">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(указывается, что выявлено, какие документы прилагаются)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									9. При осмотре товаров, находящихся в грузовом отсеке, установлено: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:for-each select="vsa:GoodsCheckResult">
														<xsl:if test="position()!=1"><br/></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(указывается, что выявлено)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									10. Подпись должностно лица таможенного органа, составившего акт: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="vsa:PersonSignatureAuthorAct" mode="fio"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(подпись, фамилия, инициалы должностного лица таможенного органа)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									11. Перевозчик (лицо, управляющее автомобильным транспортным средством): 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="vsa:Carrier" mode="fio"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(подпись, фамилия, инициалы)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									12. Второй экземпляр акта на руки получил: 
									<table class="inlinetable" style="width: 100%;">
										<tbody>
											<tr align="left">
												<td class="value" width="100%">
													<xsl:apply-templates select="vsa:SecondExempReceived/vsa:Date" mode="russian_date_time"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="vsa:Carrier" mode="fio"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(дата и время получения второго экземпляра акта, фамилия, инициалы, подпись перевозчика (лица, управляющего автомобильным транспортным средством))</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="vsa:CustomsMarks">
								<tr>
									<td>
										<br/>
										13. Отметки должностного лица таможенного органа, составившего акт: 
										<table class="inlinetable" style="width: 100%;">
											<tbody>
												<tr align="left">
													<td class="value" width="100%">
														<xsl:apply-templates select="vsa:CustomsMarks"/>
														<br/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="doc">
		<xsl:if test="position()!=1">
			<br/>
		</xsl:if>
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
	
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="comma_separated">
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="regnum">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="russian_date_gtd"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number']"/>
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
	<xsl:template name="russian_time_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($dateIn,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value">
						<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
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
						<xsl:value-of select="substring($dateIn,1,2)"/>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($dateIn,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="//*[local-name()='VehicleStopAct']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_month">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_month">
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
	<xsl:template match="*" mode="russian_time_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time_date">
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
