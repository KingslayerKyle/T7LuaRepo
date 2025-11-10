local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false ), "isNormalSize", false )
end

CoD.FileshareItemLarge = InheritFrom( LUI.UIElement )
CoD.FileshareItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareItemLarge )
	self.id = "FileshareItemLarge"
	self.soundSet = "Paintshop"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 350 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 350 )
	BG:setTopBottom( true, false, 0, 290 )
	BG:setRGB( 0.4, 0.4, 0.4 )
	BG:setAlpha( 0.7 )
	self:addElement( BG )
	self.BG = BG
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
	WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -60 )
	WCFileshareIconExtraCamRender:linkToElementModel( self, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, fileId ) )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local WeaponName = LUI.UITightText.new()
	WeaponName:setLeftRight( true, false, 2.5, 350 )
	WeaponName:setTopBottom( true, false, 325, 350 )
	WeaponName:setTTF( "fonts/default.ttf" )
	WeaponName:linkToElementModel( self, "weaponName", true, function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			WeaponName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local ItemNameBg = LUI.UIImage.new()
	ItemNameBg:setLeftRight( true, false, 0, 350 )
	ItemNameBg:setTopBottom( true, false, 290, 322 )
	ItemNameBg:setAlpha( 0.8 )
	self:addElement( ItemNameBg )
	self.ItemNameBg = ItemNameBg
	
	local ItemName = LUI.UITightText.new()
	ItemName:setLeftRight( true, false, 2.5, 350 )
	ItemName:setTopBottom( true, false, 292, 322 )
	ItemName:setRGB( 0, 0, 0 )
	ItemName:setTTF( "fonts/default.ttf" )
	ItemName:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			ItemName:setText( Engine.Localize( fileName ) )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BG:completeAnimation()
				self.BG:setLeftRight( true, false, 0, 350 )
				self.BG:setTopBottom( true, false, 0, 290 )
				self.clipFinished( BG, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
				self.WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -60 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setLeftRight( true, false, 2.5, 350 )
				self.WeaponName:setTopBottom( true, false, 325, 350 )
				self.WeaponName:setAlpha( 1 )
				self.clipFinished( WeaponName, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( true, false, 0, 350 )
				self.ItemNameBg:setTopBottom( true, false, 290, 322 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( true, false, 2.5, 350 )
				self.ItemName:setTopBottom( true, false, 292, 322 )
				self.clipFinished( ItemName, {} )
			end
		},
		Short = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BG:completeAnimation()
				self.BG:setLeftRight( true, false, 0, 350 )
				self.BG:setTopBottom( true, false, 0, 215 )
				self.clipFinished( BG, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
				self.WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -135 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( true, false, 0, 350 )
				self.ItemNameBg:setTopBottom( true, false, 215, 247 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( true, false, 2.5, 350 )
				self.ItemName:setTopBottom( true, false, 217, 247 )
				self.clipFinished( ItemName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Short",
			condition = function ( menu, element, event )
				return not FileshareShowNormalSizeIcons( element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isNormalSize" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isNormalSize"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WCFileshareIconExtraCamRender:close()
		element.WeaponName:close()
		element.ItemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

