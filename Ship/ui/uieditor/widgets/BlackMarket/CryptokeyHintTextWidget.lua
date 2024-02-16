-- ddc95d13be9f475463143667404dc9cd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.CryptokeyItemHintTextInternal_Left" )

CoD.CryptokeyHintTextWidget = InheritFrom( LUI.UIElement )
CoD.CryptokeyHintTextWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CryptokeyHintTextWidget )
	self.id = "CryptokeyHintTextWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 230 )
	self:setTopBottom( true, false, 0, 47 )
	self.anyChildUsesUpdateState = true
	
	local CenteredHintText = CoD.CryptokeyItemHintTextInternal_Left.new( menu, controller )
	CenteredHintText:setLeftRight( false, false, -216, 210 )
	CenteredHintText:setTopBottom( true, false, 10.25, 53.25 )
	CenteredHintText:linkToElementModel( self, nil, false, function ( model )
		CenteredHintText:setModel( model, controller )
	end )
	CenteredHintText:linkToElementModel( self, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			CenteredHintText.textCenterAlign:setText( Engine.Localize( hintText ) )
		end
	end )
	self:addElement( CenteredHintText )
	self.CenteredHintText = CenteredHintText
	
	local LeftHintText = CoD.CryptokeyItemHintTextInternal_Left.new( menu, controller )
	LeftHintText:setLeftRight( true, false, 17.5, 443.5 )
	LeftHintText:setTopBottom( true, false, 10.25, 53.25 )
	LeftHintText:setAlpha( 0 )
	LeftHintText:linkToElementModel( self, nil, false, function ( model )
		LeftHintText:setModel( model, controller )
	end )
	LeftHintText:linkToElementModel( self, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			LeftHintText.textCenterAlign:setText( Engine.Localize( hintText ) )
		end
	end )
	self:addElement( LeftHintText )
	self.LeftHintText = LeftHintText
	
	local RightHintText = CoD.CryptokeyItemHintTextInternal_Left.new( menu, controller )
	RightHintText:setLeftRight( false, true, -449.5, -26.5 )
	RightHintText:setTopBottom( true, false, 10.25, 53.25 )
	RightHintText:setAlpha( 0 )
	RightHintText:linkToElementModel( self, nil, false, function ( model )
		RightHintText:setModel( model, controller )
	end )
	RightHintText:linkToElementModel( self, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			RightHintText.textCenterAlign:setText( Engine.Localize( hintText ) )
		end
	end )
	self:addElement( RightHintText )
	self.RightHintText = RightHintText
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( false, false, -32, 32 )
	Arrow:setTopBottom( true, false, -12, 20 )
	Arrow:setImage( RegisterImage( "uie_t7_blackmarket_hint_arrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				CenteredHintText:completeAnimation()
				self.CenteredHintText:setAlpha( 1 )
				self.clipFinished( CenteredHintText, {} )

				LeftHintText:completeAnimation()
				self.LeftHintText:setAlpha( 0 )
				self.clipFinished( LeftHintText, {} )

				RightHintText:completeAnimation()
				self.RightHintText:setLeftRight( false, true, -449.5, -17.5 )
				self.RightHintText:setTopBottom( true, false, 10.25, 53.25 )
				self.RightHintText:setAlpha( 0 )
				self.clipFinished( RightHintText, {} )
			end
		},
		LeftColumn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				CenteredHintText:completeAnimation()
				self.CenteredHintText:setAlpha( 0 )
				self.clipFinished( CenteredHintText, {} )

				LeftHintText:completeAnimation()
				self.LeftHintText:setAlpha( 1 )
				self.clipFinished( LeftHintText, {} )

				RightHintText:completeAnimation()
				self.RightHintText:setAlpha( 0 )
				self.clipFinished( RightHintText, {} )
			end
		},
		RightColumn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				CenteredHintText:completeAnimation()
				self.CenteredHintText:setAlpha( 0 )
				self.clipFinished( CenteredHintText, {} )

				LeftHintText:completeAnimation()
				self.LeftHintText:setAlpha( 0 )
				self.clipFinished( LeftHintText, {} )

				RightHintText:completeAnimation()
				self.RightHintText:setAlpha( 1 )
				self.clipFinished( RightHintText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "LeftColumn",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "hintTextAlign", Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
			end
		},
		{
			stateName = "RightColumn",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "hintTextAlign", Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
			end
		}
	} )
	self:linkToElementModel( self, "hintTextAlign", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hintTextAlign"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CenteredHintText:close()
		element.LeftHintText:close()
		element.RightHintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
