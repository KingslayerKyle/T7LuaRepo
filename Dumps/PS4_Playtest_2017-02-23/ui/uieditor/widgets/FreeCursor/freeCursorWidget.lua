require( "ui.uieditor.widgets.FreeCursor.freeCursorCursor" )
require( "ui.uieditor.widgets.FreeCursor.freeCursorInfoPanelContainer" )

CoD.freeCursorWidget = InheritFrom( LUI.UIElement )
CoD.freeCursorWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorWidget )
	self.id = "freeCursorWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 140 )
	self:setTopBottom( 0, 0, 0, 140 )
	self.anyChildUsesUpdateState = true
	
	local infoPanelContainer = CoD.freeCursorInfoPanelContainer.new( menu, controller )
	infoPanelContainer:setLeftRight( 0, 0, 113, 513 )
	infoPanelContainer:setTopBottom( 0, 0, 110, 1190 )
	infoPanelContainer:linkToElementModel( self, nil, false, function ( model )
		infoPanelContainer:setModel( model, controller )
	end )
	self:addElement( infoPanelContainer )
	self.infoPanelContainer = infoPanelContainer
	
	local freeCursorCursor = CoD.freeCursorCursor.new( menu, controller )
	freeCursorCursor:setLeftRight( 0, 1, 0, 0 )
	freeCursorCursor:setTopBottom( 0, 1, 0, 0 )
	freeCursorCursor:linkToElementModel( self, nil, false, function ( model )
		freeCursorCursor:setModel( model, controller )
	end )
	self:addElement( freeCursorCursor )
	self.freeCursorCursor = freeCursorCursor
	
	self.resetProperties = function ()
		infoPanelContainer:completeAnimation()
		infoPanelContainer:setLeftRight( 0, 0, 113, 513 )
		infoPanelContainer:setTopBottom( 0, 0, 110, 1190 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		AlignLeftTop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				infoPanelContainer:completeAnimation()
				self.infoPanelContainer:setLeftRight( 0, 0, -384, 16 )
				self.infoPanelContainer:setTopBottom( 0, 0, -1050, 30 )
				self.clipFinished( infoPanelContainer, {} )
			end
		},
		AlignLeftBottom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				infoPanelContainer:completeAnimation()
				self.infoPanelContainer:setLeftRight( 0, 0, -384, 16 )
				self.infoPanelContainer:setTopBottom( 0, 0, 110, 1190 )
				self.clipFinished( infoPanelContainer, {} )
			end
		},
		AlignRightTop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				infoPanelContainer:completeAnimation()
				self.infoPanelContainer:setLeftRight( 0, 0, 113, 513 )
				self.infoPanelContainer:setTopBottom( 0, 0, -1050, 30 )
				self.clipFinished( infoPanelContainer, {} )
			end
		},
		AlignRightBottom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AlignLeftTop",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsFreeCursorOnLeftOfScreen( controller ) then
					f10_local0 = not IsFreeCursorOnTopOfScreen( controller )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		},
		{
			stateName = "AlignLeftBottom",
			condition = function ( menu, element, event )
				return not IsFreeCursorOnLeftOfScreen( controller )
			end
		},
		{
			stateName = "AlignRightTop",
			condition = function ( menu, element, event )
				return not IsFreeCursorOnTopOfScreen( controller )
			end
		},
		{
			stateName = "AlignRightBottom",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( DataSources.FreeCursor.getModel( controller ), "position" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "position"
		} )
	end )
	infoPanelContainer.id = "infoPanelContainer"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.infoPanelContainer:close()
		self.freeCursorCursor:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	CallCustomElementFunction_Self( self, "setupFreeCursor", controller )
	return self
end

