require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	Engine.CreateModel( f1_local0, "itemsCount", false )
	Engine.CreateModel( f1_local0, "PublishMode", false )
end

CoD.FileshareNoContentGraphic = InheritFrom( LUI.UIElement )
CoD.FileshareNoContentGraphic.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareNoContentGraphic )
	self.id = "FileshareNoContentGraphic"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 749 )
	self:setTopBottom( true, false, 0, 478 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, -3, -3 )
	StartMenuframenoBG0:setTopBottom( true, true, -3, -4 )
	StartMenuframenoBG0:setAlpha( 0.85 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactiveDiag = LUI.UIImage.new()
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -4, -3 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -3, -4 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.45 )
	BoxButtonLrgInactiveDiag:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediagfull" ) )
	BoxButtonLrgInactiveDiag:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveDiag:setShaderVector( 0, 0.03, 0.05, 0, 0 )
	BoxButtonLrgInactiveDiag:setupNineSliceShader( 24, 24 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not FileshareHasContent( element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

