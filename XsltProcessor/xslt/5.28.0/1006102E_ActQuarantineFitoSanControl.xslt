<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:aqfsc="urn:customs.ru:Information:CustomsDocuments:ActQuarantineFitoSanControl:5.26.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ActQuarantineFitoSanControlType -->
	<xsl:template match="aqfsc:ActQuarantineFitoSanControl">
		<xsl:param name="w" select="210"/>
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
				.borderBottom{
					border-bottom: 1px solid black;
				}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="center">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:NameSubject"/>
									<br/>
									<xsl:apply-templates select="aqfsc:NameManagement"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование уполномоченного органа, выдавшего акт)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<th>
									<br/>
									<br/>
									<xsl:text>АКТ</xsl:text>
									<br/>
									<xsl:text>карантинного фитосанитарного контроля (надзора)</xsl:text>
								</th>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top">
								<td width="50%">
									<xsl:text>от </xsl:text>
									<table class="inlinetable" style="width: 80%;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:apply-templates select="aqfsc:IssueDate" mode="russian_date_month"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr" width="100%">
													<xsl:text>(дата выдачи)</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="50%" align="right">
									<xsl:text>№ </xsl:text>
									<table class="inlinetable" style="width: 80%;">
										<tbody>
											<tr align="center">
												<td class="value" width="100%">
													<xsl:apply-templates select="aqfsc:RegistrationNumber"/>
													<br/>
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
					<xsl:text>Мною, уполномоченным должностным лицом, </xsl:text>
					<table class="inlinetable" style="width: 50%;">
						<tbody>
							<tr align="center">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:AuthorizedOfficial"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(должность, Ф.И.О.)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>проведен карантинный фитосанитарный контроль (наздор) подкарантинной продукции:</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:for-each select="aqfsc:DescriptionConsignment">
										<xsl:if test="position() != 1"><br/></xsl:if>
										<xsl:for-each select="*[local-name() = 'GoodsDescription' or local-name() = 'QuantityPlace' or local-name() = 'GoodsWeightQuantity']">
											<xsl:if test="position() != 1">, </xsl:if>
											<xsl:choose>
												<xsl:when test="local-name() = 'QuantityPlace'">кол-во мест: </xsl:when>
												<xsl:when test="local-name() = 'GoodsWeightQuantity'">вес: </xsl:when>
											</xsl:choose>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование и количество подкарантинной продукции)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>и транспортных средств:</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:TransportMeans"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(номера транспортных средств)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>поступивших из </xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:for-each select="aqfsc:DescriptionConsignment/aqfsc:Arrival">
										<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
										<xsl:for-each select="*">
											<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование страны)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>происхождением из </xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:for-each select="aqfsc:DescriptionConsignment/aqfsc:Origin">
										<xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
										<xsl:for-each select="*">
											<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</xsl:for-each>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование страны)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Фитосанитарный сертификат</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:FitoSanitaryCertificateInfo"/>
									<xsl:if test="not(aqfsc:FitoSanitaryCertificateInfo/*[contains(local-name(), 'PrDocument')])">отсутствует</xsl:if>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(номер фитосанитарного сертификата, дата выдачи)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>выданный</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<!--xsl:if test="not(aqfsc:FitoSanitaryCertificateInfo/*[contains(local-name(), 'PrDocument')])">отсутствует</xsl:if-->
									<xsl:choose>
										<xsl:when test="not(aqfsc:FitoSanitaryCertificateInfo/aqfsc:IssueCountryName)">отсутствует</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:IssueCountryName"/>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование страны)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Экспортер (отправитель)</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Sender" mode="org"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование и адрес организации)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Импортер (получатель)</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Receiver" mode="org"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование и адрес организации)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>В результате </xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:ControlActivities"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr" width="100%">
									<xsl:text>(наименование мероприятия)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>установлено: </xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:ResultScreening"/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Для анализа или экспертизы подкарантинной продукции отобраны образцы (пробы) в количестве </xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<!--xsl:apply-templates select="aqfsc:ConfiscationSamples"/-->
									<xsl:text>Образец не отбирался</xsl:text>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Действия с образцами (пробами)</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<!--xsl:apply-templates select="aqfsc:ReturnDestructionSamples"/-->
									<xsl:text>Образец не отбирался</xsl:text>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Предписываются следующие карантинные фитосанитарные мероприятия:</xsl:text>
					<table class="inlinetable" style="width: 100%;">
						<tbody>
							<tr align="left">
								<td class="value" width="100%">
									<xsl:apply-templates select="aqfsc:Prescription"/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr valign="bottom">
								<td width="40%">Акт составлен в присутствии собственника (представителя собственника) груза</td>
								<td width="10%" class="borderBottom"></td>
								<td width="50%" class="borderBottom" align="center">
									<xsl:for-each select="aqfsc:Owner/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td class="descr">(подпись)</td>
								<td class="descr">(Ф.И.О.)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr valign="bottom">
								<td width="40%">Уполномоченное должностное лицо</td>
								<td width="10%" class="borderBottom"></td>
								<td width="50%" class="borderBottom" align="center">
									<xsl:for-each select="aqfsc:AuthorizedOfficial/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td class="descr">(подпись)</td>
								<td class="descr">(Ф.И.О.)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:text>М.П.</xsl:text>
				</div>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr align="right">
								<td>
									<xsl:text>Приложение</xsl:text>
									<br/>
									<xsl:text>к акту карантинного фитосанитарного</xsl:text>
									<br/>
									<xsl:text>контроля (наздора) </xsl:text>
									<bt/>
									<xsl:text>от </xsl:text>
									<xsl:apply-templates select="aqfsc:IssueDate" mode="russian_date_month"/>
									<xsl:text> № </xsl:text>
									<xsl:apply-templates select="aqfsc:RegistrationNumber"/>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered" rowspan="2">№ п/п</td>
								<td class="bordered" rowspan="2">Наименование подкарантинной продукции</td>
								<td class="bordered" rowspan="2">Номер фитосанитарного сертификата</td>
								<td class="bordered" rowspan="2">Количество подкарантинной продукции (в соотвествующих ед.изм.)</td>
								<td class="bordered" colspan="3">Отобранный средний образец (проба)</td>
							</tr>
							<tr>
								<td class="bordered">кол-во</td>
								<td class="bordered">ед.изм.</td>
								<td class="bordered">действие с образцом (пробой)</td>
							</tr>
							<xsl:for-each select="aqfsc:DescriptionConsignment">
								<tr valign="top">
									<td class="bordered">
										<xsl:value-of select="position()"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="aqfsc:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="../aqfsc:FitoSanitaryCertificateInfo"/>
									</td>
									<td align="right" class="bordered">
										<xsl:text>вес: </xsl:text>
										<xsl:apply-templates select="aqfsc:GoodsWeightQuantity"/>
										<xsl:text> кг</xsl:text>
										<xsl:text>, кол-во: </xsl:text>
										<xsl:apply-templates select="aqfsc:GoodsQuantity"/>
									</td>
									<td align="center" class="bordered">
										<xsl:text> - </xsl:text>
										<!--xsl:choose>
											<xsl:when test="aqfsc:SamplesQuantity">
												<xsl:apply-templates select="aqfsc:SamplesQuantity/cat_ru:GoodsQuantity"/>
											</xsl:when>
											<xsl:otherwise> - </xsl:otherwise>
										</xsl:choose-->
									</td>
									<td align="center" class="bordered">
										<xsl:text> - </xsl:text>
										<!--xsl:choose>
											<xsl:when test="aqfsc:SamplesQuantity">
												<xsl:apply-templates select="aqfsc:SamplesQuantity/cat_ru:MeasureUnitQualifierName"/>
											</xsl:when>
											<xsl:otherwise> - </xsl:otherwise>
										</xsl:choose-->
									</td>
									<td align="center" class="bordered">
										<xsl:text>Образец не отбирался</xsl:text>
										<!--xsl:choose>
											<xsl:when test="aqfsc:SamplesQuantity and aqfsc:ReturnDestructionSamples">
												<xsl:apply-templates select="aqfsc:ReturnDestructionSamples"/>
											</xsl:when>
											<xsl:otherwise> - </xsl:otherwise>
										</xsl:choose-->
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr valign="bottom">
								<td width="40%">Уполномоченное должностное лицо</td>
								<td width="10%" class="borderBottom"></td>
								<td width="50%" class="borderBottom" align="center">
									<xsl:for-each select="aqfsc:AuthorizedOfficial/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td class="descr">(подпись)</td>
								<td class="descr">(Ф.И.О.)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:text>М.П.</xsl:text>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="aqfsc:GoodsQuantity">
		<xsl:apply-templates select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="aqfsc:TransportMeans">
		<xsl:if test="position()!=1"><xsl:text>, </xsl:text></xsl:if>
		<xsl:apply-templates select="cat_ru:TransportTypeName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:TransportIdentifier"/>
	</xsl:template>
	<xsl:template match="aqfsc:ReturnDestructionSamples">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
			 <xsl:when test=".=1">возвращены</xsl:when>
			 <xsl:when test=".=2">уничтожены</xsl:when>
			 <xsl:when test=".=3">оставлены на хранение</xsl:when>
			 <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
		  </xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="org">
		<xsl:apply-templates select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:apply-templates select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
			<xsl:text>, адрес: </xsl:text>
			<xsl:apply-templates select="cat_ru:Address" mode="address"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="aqfsc:FitoSanitaryCertificateInfo">
		<xsl:for-each select="*[contains(local-name(), 'PrDocument')]">
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Number')"><xsl:text> № </xsl:text></xsl:when>
				<xsl:when test="contains(local-name(), 'Date')"><xsl:text> от </xsl:text></xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="aqfsc:DesinfestationInfo">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates select="." mode="russian_date"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="aqfsc:LocationPlace">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="aqfsc:AuthorizedOfficial">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:apply-templates select="cat_ru:PersonPost"/>
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:for-each select="*[contains(local-name(), 'ame')]">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
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
									<xsl:value-of select="cat_ru:KGINN"/>
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
	<xsl:template match="cat_ru:RFOrganizationFeatures">
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
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring (., 9, 2)"/>
				<xsl:text> </xsl:text>
				<xsl:variable name="month" select="substring(., 6, 2)"/>
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
				<xsl:text> </xsl:text>		
				<xsl:value-of select="substring(., 1, 4)"/> г.
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ActQuarantineFitoSanControl']//*" priority="-1">
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
