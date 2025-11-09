require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.ItemWidgets.EquipmentWidget_old" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassCategoryHeader" )

CoD.SpecialGadgetWidget_old = InheritFrom( LUI.UIElement )
CoD.SpecialGadgetWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialGadgetWidget_old )
	self.id = "SpecialGadgetWidget_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 221 )
	self:setTopBottom( true, false, 0, 107 )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setRGB( 1, 1, 1 )
	BorderBakedSolid0:setAlpha( 0 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local equipment1 = CoD.EquipmentWidget_old.new( menu, controller )
	equipment1:setLeftRight( false, false, -29.5, 29.5 )
	equipment1:setTopBottom( false, true, -63, -4 )
	equipment1:setRGB( 1, 1, 1 )
	equipment1:setAlpha( 0 )
	equipment1:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			equipment1.mainItem:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( equipment1 )
	self.equipment1 = equipment1
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( true, false, 11, 36 )
	nameLabel:setTopBottom( true, false, 28, 43 )
	nameLabel:setRGB( 0.86, 0.89, 0.75 )
	nameLabel:setAlpha( 0 )
	nameLabel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	nameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local headerLabel = CoD.CustomClassCategoryHeader.new( menu, controller )
	headerLabel:setLeftRight( true, true, -3, 4 )
	headerLabel:setTopBottom( true, false, 0, 20 )
	headerLabel:setRGB( 1, 1, 1 )
	headerLabel:setAlpha( 0 )
	headerLabel.text:setText( Engine.Localize( "MPUI_SPECIALGADGET_CAPS" ) )
	self:addElement( headerLabel )
	self.headerLabel = headerLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.25 )
				self.clipFinished( BorderBakedSolid0, {} )
				equipment1:completeAnimation()
				self.equipment1:setAlpha( 1 )
				self.clipFinished( equipment1, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )
				headerLabel:completeAnimation()
				self.headerLabel:setAlpha( 1 )
				self.clipFinished( headerLabel, {} )
			end
		},
		NotInUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				equipment1:completeAnimation()
				self.equipment1:setAlpha( 0 )
				self.clipFinished( equipment1, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 0 )
				self.clipFinished( nameLabel, {} )
				headerLabel:completeAnimation()
				self.headerLabel:setAlpha( 0 )
				self.clipFinished( headerLabel, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.clipFinished( BorderBakedSolid0, {} )
				equipment1:completeAnimation()
				self.equipment1:setAlpha( 0 )
				self.clipFinished( equipment1, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 0 )
				self.clipFinished( nameLabel, {} )
				headerLabel:completeAnimation()
				self.headerLabel:setAlpha( 0.4 )
				self.clipFinished( headerLabel, {} )
			end
		}
	}
	self.close = function ( self )
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.equipment1:close()
		self.headerLabel:close()
		self.nameLabel:close()
		CoD.SpecialGadgetWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

