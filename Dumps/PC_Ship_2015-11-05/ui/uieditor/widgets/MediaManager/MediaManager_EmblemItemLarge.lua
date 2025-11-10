local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", true ), "isBuyMoreSlot", true )
end

CoD.MediaManager_EmblemItemLarge = InheritFrom( LUI.UIElement )
CoD.MediaManager_EmblemItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MediaManager_EmblemItemLarge )
	self.id = "MediaManager_EmblemItemLarge"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 215 )
	
	local DrawEmblem = LUI.UIElement.new()
	DrawEmblem:setLeftRight( true, false, 0, 350 )
	DrawEmblem:setTopBottom( true, false, 0, 215 )
	DrawEmblem:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local type = Engine.GetModelValue( model )
		if type then
			DrawEmblem:setupEmblem( type )
		end
	end )
	self:addElement( DrawEmblem )
	self.DrawEmblem = DrawEmblem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DrawEmblem:completeAnimation()
				self.DrawEmblem:setAlpha( 1 )
				self.clipFinished( DrawEmblem, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DrawEmblem:completeAnimation()
				self.DrawEmblem:setAlpha( 0 )
				self.clipFinished( DrawEmblem, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return MediaManagerIsBuyMoreSlot()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MediaManager.isBuyMoreSlot" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MediaManager.isBuyMoreSlot"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DrawEmblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

