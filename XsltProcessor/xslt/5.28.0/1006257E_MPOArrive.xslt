<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.24.0" xmlns:mpoa="urn:customs.ru:Information:CustomsDocuments:MPOArrive:5.24.0">
	<!-- Шаблон для типа MPOArriveType -->
	<xsl:template match="mpoa:MPOArrive">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<xsl:choose>
											<xsl:when test="mpoa:DocType=0">
												<xsl:text>Сведения о фактическом прибытии МПО</xsl:text>
											</xsl:when>
											<xsl:when test="mpoa:DocType=1">
												<xsl:text>Декларирование возвращаемого МПО</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="mpoa:DocType"/>
											</xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="mpoa:DocType='0'">
										<xsl:text>Сведения о фактическом прибытии МПО</xsl:text>
									</xsl:when>
									<xsl:when test="mpoa:DocType='1'">
										<xsl:text>декларирование возвращаемого МПО</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="mpoa:DocType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table-->
					<xsl:if test="mpoa:Reestr_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный номер реестра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpoa:Reestr_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:MPOReestr">
						<div class="title marg-top">Регистрационный номер реестра МПО</div>
						<div>
							<xsl:apply-templates select="mpoa:MPOReestr">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mpoa:MPO_Registration">
						<div class="title marg-top">Регистрационный номер МПО</div>
						<div>
							<xsl:apply-templates select="mpoa:MPO_Registration">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mpoa:MPOReg">
						<div class="title marg-top">Регистрационный номер ЭД МПО</div>
						<div>
							<xsl:apply-templates select="mpoa:MPOReg">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mpoa:DTReg">
						<div class="title marg-top">Регистрационный номер ЭДТ (декларации на товары)</div>
						<div>
							<xsl:apply-templates select="mpoa:DTReg">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<br/>
					<xsl:if test="mpoa:DocDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время формирования документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mpoa:DocDate"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(mpoa:DocDate, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:FactDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата фактического прибытия / Дата принятия МПО в ОПС</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mpoa:FactDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:ZTKTime">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата и время размещения МПО в зоне таможенного контроля ММПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mpoa:ZTKTime"/>
									</xsl:call-template>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(mpoa:ZTKTime, 12, 8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:CustomsCode">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Код таможенного органа, в регионе деятельности которого расположена зона таможенного контроля ММПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpoa:CustomsCode"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:FeedBillAgency">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Учреждение  подачи</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpoa:FeedBillAgency"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:CustAmount">
						<div class="title marg-top">Расчитанные таможенные платежи по видам</div>
						<table class="bordered">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Кодовое обозначение вида налогов, сборов или иного платежа</td>
									<td class="graphMain bordered">Сумма платежа</td>
									<td class="graphMain bordered">Цифровой код валюты суммы</td>
								</tr>
								<xsl:for-each select="mpoa:CustAmount">
									<xsl:apply-templates select=".">
										<xsl:with-param name="wdth" select="$w"/>
									</xsl:apply-templates>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:TotalAmount">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Общая сумма таможенных платежей в рублях</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="translate(mpoa:TotalAmount, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:Return">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Признак необходимости возврата МПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="mpoa:Return='true' or mpoa:Return='1'">
											<xsl:text>Есть</xsl:text>
										</xsl:when>
										<xsl:when test="mpoa:Return='false' or mpoa:Return='0'">
											<xsl:text>Нет</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="mpoa:Return"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:ReasonReturn">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Причина возврата товаров отправителю</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpoa:ReasonReturn"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:MPOFactWeight">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Фактический вес брутто МПО </td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="translate(mpoa:MPOFactWeight, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:OPSWeight">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Фактический вес брутто МПО </td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="translate(mpoa:OPSWeight, '.', ',')"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoa:Inspection">
						<div class="title marg-top">Результаты осмотра МПО</div>
						<div>
							<xsl:apply-templates select="mpoa:Inspection">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа mpoa:AmountDetailsType -->
	<xsl:template match="mpoa:CustAmount">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpoa:CustomsTaxModeCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:value-of select="translate(mpoa:PaymentAmount, '.', ',')"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpoa:PaymentCurrencyCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:CustomsPersonDetails -->
	<xsl:template match="mpoa:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PersonPost">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Должность</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpoa:InspectionType -->
	<xsl:template match="mpoa:Inspection">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="mpoa:CustomsPerson">
				<div class="title marg-top">Должностное лицо ТО</div>
				<div>
					<xsl:apply-templates select="mpoa:CustomsPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата и время проведения осмотра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="mpoa:InspectionTime"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(mpoa:InspectionTime, 12, 8)"/>
					</td>
				</tr>
			</table>
			<xsl:if test="mpoa:DisplayTime">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата и время предъявления МПО на осмотр</td>
						<td class="value graphMain" style="width:50%">
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="mpoa:DisplayTime"/>
							</xsl:call-template>
							<xsl:text> </xsl:text>
							<xsl:value-of select="substring(mpoa:DisplayTime, 12, 8)"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpoa:PackingState">
				<div class="title marg-top">Сведения об упаковке</div>
				<div>
					<xsl:apply-templates select="mpoa:PackingState">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="mpoa:Prohibited">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак наличия запрещенных вложений</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="mpoa:Prohibited='true' or mpoa:Prohibited='1'">
									<xsl:text>Есть</xsl:text>
								</xsl:when>
								<xsl:when test="mpoa:Prohibited='false' or mpoa:Prohibited='0'">
									<xsl:text>Нет</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="mpoa:Prohibited"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpoa:Perquisition">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак необходимости проведения досмотра</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="mpoa:Perquisition='true' or mpoa:Perquisition='1'">
									<xsl:text>Есть</xsl:text>
								</xsl:when>
								<xsl:when test="mpoa:Perquisition='false' or mpoa:Perquisition='0'">
									<xsl:text>Нет</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates select="mpoa:Perquisition"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="mpoa:Comment">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Комментарии</td>
						<td class="graphMain value" style="width:50%">
							<xsl:for-each select="mpoa:Comment">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpoa:MPOReestr">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">№</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mpco:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates mode="reestr_date" select="mpco:RegistrationDate"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="mpco:MPO_Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpoa:MPORegType -->
	<xsl:template match="mpoa:MPOReg">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">№</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mpoa:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates mode="reestr_date" select="mpoa:RegistrationDate"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="mpoa:MPO_Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="mpoa:DTReg">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">№</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates mode="reestr_date" select="cat_ru:RegistrationDate"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="cat_ru:GTDNumber"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mpoa:MPO_Registration">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">№</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mpoa:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates mode="reestr_date" select="mpoa:RegistrationDate"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="mpoa:MPO_Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:PackingStateType -->
	<xsl:template match="mpoa:PackingState">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Значение: 0 или false - нарушена, 1 или true - целостна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="mpco:Value='true' or mpco:Value='1'">
								<xsl:text>целостна</xsl:text>
							</xsl:when>
							<xsl:when test="mpco:Value='false' or mpco:Value='0'">
								<xsl:text>нарушена</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:apply-templates select="mpco:Value"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="mpco:Remark">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Пояснение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mpco:Remark"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template match="//*[local-name()='MPOArrive']//*" priority="-1">
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
	<xsl:template name="reestr_date">
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
	<xsl:template match="*" mode="reestr_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="reestr_date">
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
