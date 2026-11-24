<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cltComFin_ru="urn:customs.ru:Information:CommercialFinanceDocuments:CommercialFinanceCommonLeafTypesCust:5.8.0" xmlns:tmw="urn:customs.ru:Information:GuaranteeDocuments:TollsMotorWays:5.28.0">
	<xsl:template match="tmw:TollsMotorWays">
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>ТРЕБОВАНИЕ<br/>о необходимости внесения платы за проезд транспортных средств по платным автомобильным дорогам общего пользования, платным участкам автомобильных дорог общего пользования</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>В отношении средства с государственным регистрационным номером <span style="display: inline-block; width: 30mm; text-align: center; border-bottom: 1px solid black;"><xsl:apply-templates select="tmw:VehicleRegNumber"/></span> выявлена необходимость внесения платы за проезд транспортных средств по платным автомобильным дорогам общего пользования, платным участкам автомобильных дорог общего пользования</div>
					<br/>
					<table>
						<tbody valign="top">
							<tr>
								<td class="bordered title" width="40%">Дата и время начисления суммы денежных средств, подлежащих уплате</td>
								<td class="bordered value" width="60%">
									<xsl:apply-templates select="tmw:AccrualDateTime" mode="russian_date_time"/>
								</td>
							</tr>
							<tr>
								<td class="bordered title">Сумма денежных средств, подлежащих уплате</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:TotalAmount"/>
								</td>
							</tr>
							<tr>
								<td class="bordered title">Назначение платежа (данные маршрута поездки, дата и время)</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:PaymentPurpose"/>
									<xsl:apply-templates select="tmw:RouteInfo"/>
								</td>
							</tr>
							<tr>
								<td class="bordered title">Уникальный идентификатор начисления (УИН)</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:SupplierBillID"/>
								</td>
							</tr>
							<tr>
								<td class="bordered title">Данные организации, являющейся получателем денежных средств, подлежащих уплате</td>
								<td class="bordered value"></td>
							</tr>
							<tr>
								<td class="bordered">Наименование организации</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:Recipient/tmw:OrganizationName"/>
								</td>
							</tr>
							<tr>
								<td class="bordered">Идентификационный номер налогоплательщика (ИНН) организации</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:Recipient/tmw:INN"/>
								</td>
							</tr>
							<tr>
								<td class="bordered">Код причины постановки на учет (КПП) организации</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:Recipient/tmw:KPP"/>
								</td>
							</tr>
							<tr>
								<td class="bordered title">Реквизиты счета организации</td>
								<td class="bordered value"></td>
							</tr>
							<tr>
								<td class="bordered">Банковский идентификационный код (БИК) территориального органа Федерального казначейства или банка получателя</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:Recipient/tmw:BICID"/>
								</td>
							</tr>
							<tr>
								<td class="bordered">Номер единого казначейского счета или корреспондентского счета банка получателя</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:Recipient/tmw:UnifiedTreasuryAccount"/>
								</td>
							</tr>
							<tr>
								<td class="bordered">Номер казначейского счета или счета получателя средств в банке получателя</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:Recipient/tmw:TreasuryAccount"/>
								</td>
							</tr>
							<tr>
								<td class="bordered title">Реквизиты, необходимые для идентификации платежей, являющихся источниками формирования доходов бюджетов бюджетной системы Российской Федерации</td>
								<td class="bordered value"></td>
							</tr>
							<tr>
								<td class="bordered">Код бюджетной классификации (КБК)</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:Recipient/tmw:CBC"/>
								</td>
							</tr>
							<tr>
								<td class="bordered">Код из Общероссийского классификатора территорий муниципальных образований (ОКТМО)</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:Recipient/tmw:OKTMO"/>
								</td>
							</tr>
							<tr>
								<td class="bordered title">Дополнительная информация о начислении</td>
								<td class="bordered value">
									<xsl:apply-templates select="tmw:AddInformation"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="tmw:RouteInfo">
		<br/><br/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><br/></xsl:if>
			<xsl:variable name="ln" select="local-name()"/>
			<xsl:choose>
				<xsl:when test="$ln = 'RouteDescription'">Маршрут: </xsl:when>
				<xsl:when test="$ln = 'Date'">Дата: </xsl:when>
				<xsl:when test="$ln = 'SupplierBillID'">ID начисления (УИН): </xsl:when>
				<xsl:when test="$ln = 'Amount'">Сумма: </xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$ln = 'Date'">
					<xsl:apply-templates select="." mode="russian_date_time"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
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
	<xsl:template match="//*[local-name()='TollsMotorWays']//*" priority="-1">
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
