<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:agowh="urn:customs.ru:Information:WarehouseDocuments:AppGoodsOperationWH:5.24.0">
	<!-- Шаблон для типа AppGoodsOperationWHType -->
	<xsl:template match="agowh:AppGoodsOperationWH">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
					align: justify;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
					.underline{
						border-bottom: 1px solid windowtext;
					}	
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<b>Заявление<br/>
									лица, обладающего полномочиями в отношении товаров,<br/>
									о необходимости совершения в отношении товаров,<br/>
									находящихся под таможенным контролем, операций,<br/>
									предусмотренных подпунктами 1 и 2 пункта 1 статьи 84<br/>
									и статьей 102 ТК ЕАЭС</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td valign="top">
									<xsl:text>В </xsl:text>
									<table class="inlinetable" style="width: 50mm;">
										<tbody>
											<tr align="center">
												<td class="value">
													<xsl:apply-templates select="agowh:CustomsName/cat_ru:Code"/>
													<br/>
												</td>
											</tr>
											<tr align="center">
												<td class="descr">
													Код таможенного органа
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>От</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr align="center" valign="bottom">
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:AppPerson/cat_ru:PersonSurname"/>
												</td>
												<td width="5%"></td>
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:AppPerson/cat_ru:PersonName"/>
												</td>
												<td width="5%"></td>
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:AppPerson/cat_ru:PersonMiddleName"/>
												</td>
											</tr>
											<tr>
												<td class="descr">Фамилия</td>
												<td></td>
												<td class="descr">Имя</td>
												<td></td>
												<td class="descr">Отчество</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr align="center" valign="bottom">
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:AppPerson/agowh:IdentityCard/RUScat_ru:IdentityCardName"/>
												</td>
												<td width="5%"></td>
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:AppPerson/agowh:IdentityCard/RUScat_ru:IdentityCardSeries"/>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="agowh:AppPerson/agowh:IdentityCard/RUScat_ru:IdentityCardNumber"/>
												</td>
												<td width="5%"></td>
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:AppPerson/agowh:IdentityCard/RUScat_ru:IdentityCardDate" mode="doc_date"/>
												</td>
											</tr>
											<tr valign="top">
												<td class="descr">Тип документа, удостоверяющего личность</td>
												<td></td>
												<td class="descr">Серия и номер документа</td>
												<td></td>
												<td class="descr">Дата выдачи</td>
											</tr>
										</tbody>
									</table>
									<table>
										<tbody>
											<tr align="center" valign="bottom">
												<td class="value" width="47.5%">
													<xsl:apply-templates select="agowh:AppPerson/agowh:PlaceOfWork"/>
												</td>
												<td width="5%"/>
												<td class="value" width="47.5%">
													<xsl:apply-templates select="agowh:AppPerson/cat_ru:PersonPost" mode="doc_date"/>
												</td>
											</tr>
											<tr>
												<td class="descr">Место работы</td>
												<td></td>
												<td class="descr">Должность</td>
											</tr>
										</tbody>
									</table>
									<xsl:apply-templates select="agowh:AppPerson/agowh:PowersDoc"/>
									<xsl:if test="not(agowh:AppPerson/agowh:PowersDoc)">
										<xsl:call-template name="powersDoc"/>
									</xsl:if>
									<xsl:apply-templates select="agowh:AppPerson/agowh:Contact"/>
									<xsl:if test="not(agowh:AppPerson/agowh:Contact)">
										<xsl:call-template name="contact"/>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td colspan="3">
									1. Сведения о декларанте, или лице обладающем полномочиями в отношении товаров
									<table>
										<tbody>
											<tr align="center" valign="bottom">
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:Applicant/agowh:CompanyType"/><br/>
												</td>
												<td width="5%"></td>
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:Applicant/agowh:OrganizationName"/><br/>
												</td>
												<td width="5%"></td>
												<td class="value" width="30%">
													<xsl:apply-templates select="agowh:Applicant/agowh:RFOrganizationFeatures/cat_ru:INN"/><br/>
												</td>
											</tr>
											<tr valign="top">
												<td class="descr">Организационно-правовая форма / физическое лицо (если физическое лицо обладает полномочиями в отношении товаров)</td>
												<td></td>
												<td class="descr">Наименование организации / ФИО</td>
												<td></td>
												<td class="descr">ИНН</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr valign="top">
								<td width="47.5%">
									2. Сведения о транспортном средстве, на котором размещены либо прибыли товары
									<xsl:apply-templates select="agowh:TransportDetails"/>
									<xsl:if test="not(agowh:TransportDetails)">
										<xsl:call-template name="transportDetails"/>
									</xsl:if>
								</td>
								<td width="5%"/>
								<td width="47.5%">
									3. Сведения о транспортном (перевозочном) документе
									<xsl:apply-templates select="agowh:AttachedDocument"/>
									<xsl:if test="not(agowh:AttachedDocument)">
										<xsl:call-template name="attachedDocument"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									4. Номер таможенной декларации / таможенного документа
									<xsl:apply-templates select="agowh:GTDNumber"/>
									<xsl:if test="not(agowh:GTDNumber)">
										<xsl:call-template name="gtdNumber"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									5. Планируемые операции
									
								</td>
							</tr>
							<tr>
								<td colspan="3" class="value">
									<xsl:apply-templates select="agowh:Operations"/>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									6. Иные сведения
								</td>
							</tr>
							<tr>
								<td colspan="3" class="value">
									<xsl:apply-templates select="agowh:OtherInformation"/>
									<br/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template  match="agowh:GTDNumber">
		<xsl:call-template name="gtdNumber"/>
	</xsl:template>
	<xsl:template name="gtdNumber">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td class="value" width="30%">
						<xsl:apply-templates select="agowh:DocKind"/><br/>
					</td>
					<td width="5%"/>
					<td class="value" width="65%">
						<xsl:apply-templates select="agowh:CustomsDocNumber" mode="reg_number"/>
						<xsl:apply-templates select="agowh:OtherDoclNumber" mode="doc_number"/>
						<br/>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">Вид таможенной декларации / таможенного документа</td>
					<td></td>
					<td class="descr">Номер таможенной декларации / таможенного документа</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="doc_number">
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
	<xsl:template match="*" mode="reg_number">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="reg_date"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'GTDNumber']"/>
	</xsl:template>
	<xsl:template match="agowh:DocKind">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">декларация на товары</xsl:when>
				<xsl:when test=". = 2">транзитная декларация</xsl:when>
				<xsl:when test=". = 3">пассажирская таможенная декларация</xsl:when>
				<xsl:when test=". = 4">декларация на транспортное средство</xsl:when>
				<xsl:when test=". = 5">уведомление о прибытии</xsl:when>
				<xsl:when test=". = 6">отчет о принятии товаров на временное хранение</xsl:when>
				<xsl:when test=". = 7">иной документ</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template match="agowh:AttachedDocument">
		<xsl:call-template name="attachedDocument"/>
	</xsl:template>
	<xsl:template name="attachedDocument">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td class="value" width="30%">
						<xsl:apply-templates select="*[local-name() = 'DocKindCode']"/><br/>
					</td>
					<td width="5%"></td>
					<td class="value" width="30%">
						<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/><br/>
					</td>
					<td width="5%"></td>
					<td class="value" width="30%">
						<xsl:apply-templates select="*[local-name() = 'PrDocumentDate']" mode="doc_date"/><br/>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">Код вида документа</td>
					<td></td>
					<td class="descr">Номер документа</td>
					<td></td>
					<td class="descr">Дата выдачи</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="agowh:TransportDetails">
		<xsl:call-template name="transportDetails"/>
	</xsl:template>
	<xsl:template name="transportDetails">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td class="value" width="20%">
						<xsl:apply-templates select="agowh:TransportModeCode"/><br/>
					</td>
					<td width="5%"/>
					<td class="value" width="75%">
						<xsl:apply-templates select="agowh:TransportIdentifier"/><br/>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">Код вид ТС</td>
					<td></td>
					<td class="descr">Номер транспортного средства,<br/>включая номера вагонов</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="agowh:Contact">
		<xsl:call-template name="contact">
			<xsl:with-param name="cont"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="contact">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td class="value" width="47.5%">
						<xsl:for-each select="*[local-name() = 'Phone']">
							<xsl:if test="position() != 1">, </xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</td>
					<td width="5%"/>
					<td class="value" width="47.5%">
						<xsl:for-each select="*[local-name() = 'E_mail']">
							<xsl:if test="position() != 1">, </xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">Телефон</td>
					<td></td>
					<td class="descr">Адрес электронной почты</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="agowh:PowersDoc">
		<xsl:call-template name="powersDoc">
			<xsl:with-param name="doc"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="powersDoc">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td class="value" width="30%">
						<xsl:apply-templates select="agowh:PowersDocType"/><br/>
					</td>
					<td width="5%"></td>
					<td class="value" width="30%">
						<xsl:apply-templates select="agowh:PowersDocNumber"/><br/>
					</td>
					<td width="5%"></td>
					<td class="value" width="30%">
						<xsl:apply-templates select="agowh:PowersDocDate" mode="doc_date"/><br/>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">Тип документа, удостоверяющего полномочия лица на совершение действий от имени лица, обладающего полномочиями в отношении товара</td>
					<td></td>
					<td class="descr">Серия и номер документа</td>
					<td></td>
					<td class="descr">Дата выдачи</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="reg_date">
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
	<xsl:template name="doc_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
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
	<xsl:template match="//*[local-name()='AppGoodsOperationWH']//*" priority="-1">
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
	<xsl:template match="*" mode="doc_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="doc_date">
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
	<xsl:template match="*" mode="reg_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="reg_date">
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
