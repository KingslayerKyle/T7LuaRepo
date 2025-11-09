CoD.EquipmentInfoProto_Lethal = InheritFrom( LUI.UIElement )
CoD.EquipmentInfoProto_Lethal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EquipmentInfoProto_Lethal )
	self.id = "EquipmentInfoProto_Lethal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 54 )
	self:setTopBottom( true, false, 0, 37 )
	
	local Lethal = LUI.UIImage.new()
	Lethal:setLeftRight( false, true, -54, -20 )
	Lethal:setTopBottom( false, true, -36.55, 0 )
	Lethal:setRGB( 1, 1, 1 )
	Lethal:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Lethal:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Lethal:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Lethal )
	self.Lethal = Lethal
	
	local LethalCount = LUI.UIText.new()
	LethalCount:setLeftRight( false, true, -20, 0 )
	LethalCount:setTopBottom( false, true, -12, 0 )
	LethalCount:setRGB( 1, 1, 1 )
	LethalCount:setTTF( "fonts/UnitedSansRgMd.ttf" )
	LethalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	LethalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LethalCount:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhandCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LethalCount )
	self.LethalCount = LethalCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Lethal:completeAnimation()
				self.Lethal:setAlpha( 1 )
				self.clipFinished( Lethal, {} )
				LethalCount:completeAnimation()
				self.LethalCount:setAlpha( 1 )
				self.clipFinished( LethalCount, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Lethal:completeAnimation()
				self.Lethal:setAlpha( 0 )
				self.clipFinished( Lethal, {} )
				LethalCount:completeAnimation()
				self.LethalCount:setAlpha( 0 )
				self.clipFinished( LethalCount, {} )
			end
		}
	}
	self.close = function ( self )
		self.Lethal:close()
		self.LethalCount:close()
		CoD.EquipmentInfoProto_Lethal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

